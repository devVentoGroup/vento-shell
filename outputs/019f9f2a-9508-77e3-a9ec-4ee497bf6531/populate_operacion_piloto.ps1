param(
    [string]$WorkbookPath = (Join-Path $PSScriptRoot "VENTO_OPERACION_PILOTO.xlsm"),
    [string]$DataPath = (Join-Path $PSScriptRoot "operacion_piloto_data.json")
)

$ErrorActionPreference = "Stop"

function Release-ComObject {
    param($Object)
    if ($null -ne $Object) {
        try {
            [void][System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($Object)
        } catch {
        }
    }
}

function Set-TableData {
    param(
        $Sheet,
        [string]$TableName,
        [string[]]$Headers,
        [object[]]$Rows
    )

    $table = $Sheet.ListObjects.Item($TableName)
    $headerRow = $table.HeaderRowRange.Row
    $firstColumn = $table.Range.Column
    $rowCount = $Rows.Count
    $columnCount = $Headers.Count
    if ($rowCount -lt 1) {
        throw "$TableName no puede quedar sin filas."
    }

    for ($column = 1; $column -le $columnCount; $column++) {
        $actual = [string]$table.HeaderRowRange.Cells.Item(1, $column).Value2
        if ($actual -ne $Headers[$column - 1]) {
            throw "${TableName}: encabezado $column inválido. Esperado '$($Headers[$column - 1])', recibido '$actual'."
        }
    }

    $newRange = $Sheet.Range(
        $Sheet.Cells.Item($headerRow, $firstColumn),
        $Sheet.Cells.Item($headerRow + $rowCount, $firstColumn + $columnCount - 1)
    )
    $table.Resize($newRange)

    $template = $Sheet.Range(
        $Sheet.Cells.Item($headerRow + 1, $firstColumn),
        $Sheet.Cells.Item($headerRow + 1, $firstColumn + $columnCount - 1)
    )
    $template.Copy($table.DataBodyRange) | Out-Null

    $matrix = New-Object 'object[,]' $rowCount, $columnCount
    for ($row = 0; $row -lt $rowCount; $row++) {
        for ($column = 0; $column -lt $columnCount; $column++) {
            $property = $Headers[$column]
            $value = $Rows[$row].$property
            if ($null -eq $value) {
                $value = ""
            }
            $matrix[$row, $column] = $value
        }
    }
    $table.DataBodyRange.Value2 = $matrix

    Release-ComObject $template
    Release-ComObject $newRange
    Release-ComObject $table
}

$resolvedWorkbook = (Resolve-Path $WorkbookPath).Path
$resolvedData = (Resolve-Path $DataPath).Path
$data = Get-Content -LiteralPath $resolvedData -Raw -Encoding UTF8 | ConvertFrom-Json
if (-not $data.metadata.read_only) {
    throw "El archivo de datos no declara una extracción de solo lectura."
}

$catalogHeaders = @(
    "producto_id", "nombre_producto", "categoria", "presentacion_id", "presentacion",
    "unidad_base", "unidad_operativa", "factor_conversion", "controla_lote", "controla_vencimiento",
    "controla_frio", "temperatura_min_c", "temperatura_max_c", "es_retornable",
    "proveedor_referencia", "estado_registro", "fecha_alta", "responsable", "observaciones"
)
$locationHeaders = @(
    "ubicacion_id", "sede", "area", "zona", "punto", "tipo_ubicacion",
    "permite_inventario", "requiere_frio", "estado_registro", "responsable", "observaciones"
)

$backupDirectory = Join-Path (Split-Path $resolvedWorkbook) "backups"
New-Item -ItemType Directory -Path $backupDirectory -Force | Out-Null
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupPath = Join-Path $backupDirectory "VENTO_OPERACION_PILOTO_ANTES_DATOS_REALES_$timestamp.xlsm"
Copy-Item -LiteralPath $resolvedWorkbook -Destination $backupPath

$excel = $null
$workbook = $null
$catalogSheet = $null
$locationSheet = $null
$listSheet = $null
$panelSheet = $null

try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.EnableEvents = $false
    $excel.AskToUpdateLinks = $false
    $excel.AutomationSecurity = 3
    $workbook = $excel.Workbooks.Open($resolvedWorkbook, 0, $false)

    $catalogSheet = $workbook.Worksheets.Item("01_CATALOGOS")
    $locationSheet = $workbook.Worksheets.Item("02_UBICACIONES")
    $listSheet = $workbook.Worksheets.Item("99_LISTAS")
    $panelSheet = $workbook.Worksheets.Item("12_PANEL")

    Set-TableData $catalogSheet "tblCatalogos" $catalogHeaders @($data.catalogos)
    Set-TableData $locationSheet "tblUbicaciones" $locationHeaders @($data.ubicaciones)

    $catalogSheet.Range("A2").Value2 = "Catálogo real de productos activos sincronizado desde Supabase. Se conserva una presentación operativa priorizada por producto para evitar duplicar el identificador canónico."
    $catalogSheet.Range("A5").Value2 = "Los campos de lote, vencimiento, frío, retornable y proveedor quedan vacíos cuando la base no contiene evidencia suficiente. Revísalos antes de operar."
    $locationSheet.Range("A2").Value2 = "Sedes, áreas y ubicaciones físicas activas sincronizadas desde Supabase. Cada ubicacion_id conserva su UUID canónico."
    $locationSheet.Range("A5").Value2 = "Valida físicamente el control de frío y completa responsables; no se infirieron esos datos desde nombres o códigos."

    foreach ($name in @("lstProductos", "lstUbicaciones")) {
        try {
            $workbook.Names.Item($name).Delete()
        } catch {
        }
    }
    $workbook.Names.Add("lstProductos", "=tblCatalogos[producto_id]") | Out-Null
    $workbook.Names.Add("lstUbicaciones", "=tblUbicaciones[ubicacion_id]") | Out-Null

    $siteColumn = $null
    for ($column = 1; $column -le $listSheet.UsedRange.Columns.Count; $column++) {
        if ([string]$listSheet.Cells.Item(1, $column).Value2 -eq "Sedes") {
            $siteColumn = $column
            break
        }
    }
    if ($null -eq $siteColumn) {
        throw "No se encontró la lista Sedes en 99_LISTAS."
    }
    $listSheet.Range(
        $listSheet.Cells.Item(2, $siteColumn),
        $listSheet.Cells.Item([Math]::Max(2, $listSheet.UsedRange.Rows.Count + 5), $siteColumn)
    ).ClearContents()
    for ($row = 0; $row -lt $data.sedes.Count; $row++) {
        $listSheet.Cells.Item(2 + $row, $siteColumn).Value2 = [string]$data.sedes[$row]
    }
    try {
        $workbook.Names.Item("lstSedes").Delete()
    } catch {
    }
    $columnLetter = ($listSheet.Cells.Item(1, $siteColumn).Address($false, $false) -replace '\d', '')
    $siteRange = "='99_LISTAS'!`$$columnLetter`$2:`$$columnLetter`$$($data.sedes.Count + 1)"
    $workbook.Names.Add("lstSedes", $siteRange) | Out-Null

    $panelSheet.Range("A10").Formula = '=COUNTIF(tblCatalogos[estado_registro],"ACTIVO")'
    $excel.CalculateFull()
    $workbook.Save()

    [pscustomobject]@{
        workbook = $resolvedWorkbook
        backup = $backupPath
        products = $data.catalogos.Count
        locations = $data.ubicaciones.Count
        sites = $data.sedes.Count
    } | ConvertTo-Json -Compress
} finally {
    if ($null -ne $workbook) {
        try {
            $workbook.Close($false)
        } catch {
        }
    }
    if ($null -ne $excel) {
        try {
            $excel.Quit()
        } catch {
        }
    }
    Release-ComObject $panelSheet
    Release-ComObject $listSheet
    Release-ComObject $locationSheet
    Release-ComObject $catalogSheet
    Release-ComObject $workbook
    Release-ComObject $excel
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
