param(
    [string]$WorkbookPath = (Join-Path $PSScriptRoot "VENTO_OPERACION_PILOTO.xlsm"),
    [string]$ReportPath = (Join-Path $PSScriptRoot "verification_real_data.json")
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

function Get-ZipEntryBytes {
    param(
        [string]$ArchivePath,
        [string]$EntryName
    )
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($ArchivePath)
    try {
        $entry = $archive.GetEntry($EntryName)
        if ($null -eq $entry) {
            return $null
        }
        $stream = $entry.Open()
        try {
            $memory = New-Object System.IO.MemoryStream
            $stream.CopyTo($memory)
            return $memory.ToArray()
        } finally {
            $stream.Dispose()
        }
    } finally {
        $archive.Dispose()
    }
}

$resolvedWorkbook = (Resolve-Path $WorkbookPath).Path
$excel = $null
$workbook = $null
$catalogTable = $null
$locationTable = $null
$formulaErrors = @()
$externalFormulas = @()

try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.EnableEvents = $false
    $excel.AskToUpdateLinks = $false
    $excel.AutomationSecurity = 3
    $workbook = $excel.Workbooks.Open($resolvedWorkbook, 0, $true)
    $excel.CalculateFull()

    $catalogTable = $workbook.Worksheets.Item("01_CATALOGOS").ListObjects.Item("tblCatalogos")
    $locationTable = $workbook.Worksheets.Item("02_UBICACIONES").ListObjects.Item("tblUbicaciones")

    foreach ($sheet in @($workbook.Worksheets)) {
        $usedRange = $sheet.UsedRange
        foreach ($cell in @($usedRange.Cells)) {
            if ($cell.HasFormula) {
                $formula = [string]$cell.Formula
                if ($formula -match '\[[^\]]+\.xls[mxb]?\]') {
                    $externalFormulas += "$($sheet.Name)!$($cell.Address($false, $false)): $formula"
                }
                if ([string]$cell.Text -match '^#(REF|VALUE|NAME|DIV/0|N/A|NUM|NULL)') {
                    $formulaErrors += "$($sheet.Name)!$($cell.Address($false, $false)): $($cell.Text)"
                }
            }
        }
        Release-ComObject $usedRange
    }

    $links = @()
    try {
        $linkSources = $workbook.LinkSources(1)
        if ($null -ne $linkSources) {
            $links = @($linkSources)
        }
    } catch {
    }

    $macroBytes = Get-ZipEntryBytes $resolvedWorkbook "xl/vbaProject.bin"
    $latestBackup = Get-ChildItem -LiteralPath (Join-Path (Split-Path $resolvedWorkbook) "backups") `
        -Filter "VENTO_OPERACION_PILOTO_ANTES_DATOS_REALES_*.xlsm" |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1
    $backupMacroBytes = if ($null -ne $latestBackup) {
        Get-ZipEntryBytes $latestBackup.FullName "xl/vbaProject.bin"
    } else {
        $null
    }
    $macroDifferentBytes = $null
    if ($null -ne $macroBytes -and $null -ne $backupMacroBytes -and $macroBytes.Length -eq $backupMacroBytes.Length) {
        $macroDifferentBytes = 0
        for ($index = 0; $index -lt $macroBytes.Length; $index++) {
            if ($macroBytes[$index] -ne $backupMacroBytes[$index]) {
                $macroDifferentBytes++
            }
        }
    }

    $catalogRows = $catalogTable.ListRows.Count
    $locationRows = $locationTable.ListRows.Count
    $firstProduct = [string]$catalogTable.DataBodyRange.Cells.Item(1, 2).Value2
    $lastProduct = [string]$catalogTable.DataBodyRange.Cells.Item($catalogRows, 2).Value2
    $placeholderProducts = 0
    foreach ($cell in @($catalogTable.ListColumns.Item("producto_id").DataBodyRange.Cells)) {
        if ([string]$cell.Value2 -like "PILOTO-PROD-*") {
            $placeholderProducts++
        }
    }

    $validationChecks = [ordered]@{
        catalog_status = $catalogTable.ListColumns.Item("estado_registro").DataBodyRange.Cells.Item(1, 1).Validation.Type
        catalog_unit = $catalogTable.ListColumns.Item("unidad_base").DataBodyRange.Cells.Item(1, 1).Validation.Type
        location_site = $locationTable.ListColumns.Item("sede").DataBodyRange.Cells.Item(1, 1).Validation.Type
        remission_product = $workbook.Worksheets.Item("04_REMISIONES").Range("G8").Validation.Type
    }

    $report = [ordered]@{
        workbook = $resolvedWorkbook
        verified_at = (Get-Date).ToString("o")
        sheets = $workbook.Worksheets.Count
        tables = $workbook.Worksheets | ForEach-Object { $_.ListObjects.Count } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
        catalog_rows = $catalogRows
        location_rows = $locationRows
        first_product = $firstProduct
        last_product = $lastProduct
        placeholder_products = $placeholderProducts
        dashboard_active_products = $workbook.Worksheets.Item("12_PANEL").Range("A10").Value2
        lstProductos = $workbook.Names.Item("lstProductos").RefersTo
        lstUbicaciones = $workbook.Names.Item("lstUbicaciones").RefersTo
        lstSedes = $workbook.Names.Item("lstSedes").RefersTo
        external_links = $links.Count
        external_formulas = $externalFormulas
        formula_errors = $formulaErrors
        macro_present = ($null -ne $macroBytes)
        macro_size = if ($null -ne $macroBytes) { $macroBytes.Length } else { 0 }
        backup_macro_size = if ($null -ne $backupMacroBytes) { $backupMacroBytes.Length } else { 0 }
        macro_different_bytes = $macroDifferentBytes
        macro_structurally_preserved = (
            $null -ne $macroDifferentBytes -and
            $macroBytes.Length -eq $backupMacroBytes.Length -and
            $macroDifferentBytes -le 64
        )
        validation_types = $validationChecks
    }

    $json = $report | ConvertTo-Json -Depth 6
    Set-Content -LiteralPath $ReportPath -Value $json -Encoding UTF8
    $json

    if ($catalogRows -ne 950) { throw "Se esperaban 950 productos y se encontraron $catalogRows." }
    if ($locationRows -ne 12) { throw "Se esperaban 12 ubicaciones y se encontraron $locationRows." }
    if ($placeholderProducts -ne 0) { throw "Persisten $placeholderProducts productos de ejemplo." }
    if ($links.Count -ne 0) { throw "El libro contiene $($links.Count) vínculo(s) externo(s)." }
    if ($externalFormulas.Count -ne 0) { throw "El libro contiene fórmulas externas." }
    if ($formulaErrors.Count -ne 0) { throw "El libro contiene errores de fórmula." }
    if ($null -eq $macroBytes) { throw "El libro no contiene xl/vbaProject.bin." }
    if ($macroBytes.Length -ne $backupMacroBytes.Length -or $macroDifferentBytes -gt 64) {
        throw "El proyecto VBA cambió más allá de los metadatos normales de guardado."
    }
    if ([int]$workbook.Worksheets.Item("12_PANEL").Range("A10").Value2 -ne 950) {
        throw "El panel no refleja los 950 productos activos."
    }
    foreach ($entry in $validationChecks.GetEnumerator()) {
        if ([int]$entry.Value -ne 3) {
            throw "La validación de lista '$($entry.Key)' no se conservó."
        }
    }
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
    Release-ComObject $locationTable
    Release-ComObject $catalogTable
    Release-ComObject $workbook
    Release-ComObject $excel
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
