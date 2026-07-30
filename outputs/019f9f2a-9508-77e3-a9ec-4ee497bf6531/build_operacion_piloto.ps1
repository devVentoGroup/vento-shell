param(
    [string]$OutputDirectory = (Join-Path $PSScriptRoot ".")
)

$ErrorActionPreference = "Stop"

function Get-OleColor {
    param([int]$Red, [int]$Green, [int]$Blue)
    return $Red + (256 * $Green) + (65536 * $Blue)
}

$colors = @{
    Navy       = Get-OleColor 21 47 74
    Blue       = Get-OleColor 31 106 166
    Teal       = Get-OleColor 20 132 128
    Mint       = Get-OleColor 220 242 239
    Sky        = Get-OleColor 226 239 250
    Sand       = Get-OleColor 255 247 224
    Orange     = Get-OleColor 230 126 34
    Red        = Get-OleColor 192 57 43
    RedSoft    = Get-OleColor 252 228 225
    Green      = Get-OleColor 39 132 94
    GreenSoft  = Get-OleColor 226 244 234
    Gray50     = Get-OleColor 248 250 252
    Gray100    = Get-OleColor 238 242 246
    Gray200    = Get-OleColor 217 225 232
    Gray500    = Get-OleColor 91 106 120
    Gray800    = Get-OleColor 37 49 60
    White      = Get-OleColor 255 255 255
    Input      = Get-OleColor 255 252 235
    Formula    = Get-OleColor 235 246 255
}

$xlSrcRange = 1
$xlYes = 1
$xlValidateList = 3
$xlValidAlertStop = 1
$xlBetween = 1
$xlSheetVeryHidden = 2
$xlOpenXMLWorkbookMacroEnabled = 52
$xlColumnClustered = 51
$msoShapeRoundedRectangle = 5
$msoFalse = 0
$msoTrue = -1
$xlCalculationAutomatic = -4105

function Set-CellBorder {
    param($Range, [int]$Color)
    foreach ($edge in @(7, 8, 9, 10, 11, 12)) {
        try {
            $Range.Borders.Item($edge).LineStyle = 1
            $Range.Borders.Item($edge).Color = $Color
            $Range.Borders.Item($edge).Weight = 2
        } catch {
        }
    }
}

function Set-SheetHeader {
    param(
        $Sheet,
        [string]$Title,
        [string]$Subtitle,
        [int]$LastColumn,
        [string]$Instruction
    )

    $lastLetter = $Sheet.Cells.Item(1, $LastColumn).Address($false, $false) -replace '\d', ''
    $Sheet.Activate()
    $Sheet.Application.ActiveWindow.DisplayGridlines = $false
    $Sheet.Cells.Font.Name = "Aptos"
    $Sheet.Cells.Font.Size = 10
    $Sheet.Cells.VerticalAlignment = -4108

    $Sheet.Range("A1:${lastLetter}1").Merge()
    $Sheet.Range("A1").Value2 = $Title
    $Sheet.Range("A1:${lastLetter}1").Interior.Color = $colors.Navy
    $Sheet.Range("A1:${lastLetter}1").Font.Color = $colors.White
    $Sheet.Range("A1:${lastLetter}1").Font.Bold = $true
    $Sheet.Range("A1:${lastLetter}1").Font.Size = 20
    $Sheet.Range("A1:${lastLetter}1").HorizontalAlignment = -4131
    $Sheet.Rows.Item(1).RowHeight = 36

    $Sheet.Range("A2:${lastLetter}2").Merge()
    $Sheet.Range("A2").Value2 = $Subtitle
    $Sheet.Range("A2:${lastLetter}2").Interior.Color = $colors.Sky
    $Sheet.Range("A2:${lastLetter}2").Font.Color = $colors.Gray800
    $Sheet.Range("A2:${lastLetter}2").Font.Size = 11
    $Sheet.Range("A2:${lastLetter}2").WrapText = $true
    $Sheet.Rows.Item(2).RowHeight = 30

    $Sheet.Range("A5:${lastLetter}5").Merge()
    $Sheet.Range("A5").Value2 = $Instruction
    $Sheet.Range("A5:${lastLetter}5").Interior.Color = $colors.Sand
    $Sheet.Range("A5:${lastLetter}5").Font.Color = $colors.Gray800
    $Sheet.Range("A5:${lastLetter}5").Font.Italic = $true
    $Sheet.Range("A5:${lastLetter}5").WrapText = $true
    $Sheet.Rows.Item(5).RowHeight = 32
}

function Add-ActionButton {
    param(
        $Sheet,
        [string]$Caption,
        [double]$Left,
        [double]$Top,
        [double]$Width,
        [string]$Macro,
        [int]$FillColor,
        [string]$TargetSheet = ""
    )

    $shape = $Sheet.Shapes.AddShape($msoShapeRoundedRectangle, $Left, $Top, $Width, 25)
    $shape.Name = "btn_" + (($Caption -replace '[^A-Za-z0-9]', '_').Trim('_')) + "_" + $Sheet.Index
    $shape.TextFrame2.TextRange.Text = $Caption
    $shape.TextFrame2.TextRange.Font.Name = "Aptos"
    $shape.TextFrame2.TextRange.Font.Size = 9
    $shape.TextFrame2.TextRange.Font.Bold = $msoTrue
    $shape.TextFrame2.TextRange.Font.Fill.ForeColor.RGB = $colors.White
    $shape.TextFrame2.VerticalAnchor = 3
    $shape.TextFrame2.TextRange.ParagraphFormat.Alignment = 2
    $shape.Fill.ForeColor.RGB = $FillColor
    $shape.Line.Visible = $msoFalse
    $shape.OnAction = $Macro
    if ($TargetSheet) {
        $shape.AlternativeText = $TargetSheet
    }
    return $shape
}

function Add-StandardButtons {
    param($Sheet, [bool]$CanAdd = $true)
    $top = 71
    $null = Add-ActionButton $Sheet "⌂ INICIO" 8 $top 88 "IrAInicio" $colors.Navy
    if ($CanAdd) {
        $null = Add-ActionButton $Sheet "＋ NUEVO REGISTRO" 103 $top 128 "NuevoRegistro" $colors.Teal
        $null = Add-ActionButton $Sheet "LIMPIAR FILTROS" 238 $top 112 "LimpiarFiltros" $colors.Blue
    }
    $null = Add-ActionButton $Sheet "ACTUALIZAR" 357 $top 92 "ActualizarPanel" $colors.Orange
}

function Add-ListValidation {
    param($Range, [string]$ListName)
    try { $Range.Validation.Delete() } catch {}
    $Range.Validation.Add($xlValidateList, $xlValidAlertStop, $xlBetween, "=$ListName")
    $Range.Validation.IgnoreBlank = $true
    $Range.Validation.InCellDropdown = $true
    $Range.Validation.ShowError = $true
    $Range.Validation.ErrorTitle = "Valor no permitido"
    $Range.Validation.ErrorMessage = "Selecciona un valor de la lista."
}

function Add-TableSheet {
    param(
        $Workbook,
        [string]$Name,
        [string]$Title,
        [string]$Subtitle,
        [string]$Instruction,
        [string]$TableName,
        [string[]]$Headers,
        [object[][]]$InitialRows,
        [hashtable]$Widths,
        [hashtable]$Validations,
        [hashtable]$FormulaColumns,
        [string[]]$DateColumns,
        [string[]]$NumberColumns,
        [string[]]$PercentColumns
    )

    Write-BuildLog "BEGIN_$Name"
    $sheet = $Workbook.Worksheets.Add()
    $sheet.Name = $Name
    Set-SheetHeader $sheet $Title $Subtitle $Headers.Count $Instruction
    Add-StandardButtons $sheet $true
    Write-BuildLog "HEADER_$Name"

    for ($c = 1; $c -le $Headers.Count; $c++) {
        $sheet.Cells.Item(7, $c).Value2 = $Headers[$c - 1]
    }

    $rowCount = [Math]::Max(1, $InitialRows.Count)
    if ($InitialRows.Count -gt 0) {
        for ($r = 0; $r -lt $InitialRows.Count; $r++) {
            for ($c = 0; $c -lt $Headers.Count; $c++) {
                $value = if ($c -lt $InitialRows[$r].Count) { $InitialRows[$r][$c] } else { $null }
                if ($null -ne $value) {
                    $sheet.Cells.Item(8 + $r, 1 + $c).Value2 = $value
                }
            }
        }
    }

    $lastLetter = $sheet.Cells.Item(7, $Headers.Count).Address($false, $false) -replace '\d', ''
    $tableRange = $sheet.Range("A7:${lastLetter}$($rowCount + 7)")
    $table = $sheet.ListObjects.Add($xlSrcRange, $tableRange, $null, $xlYes)
    $table.Name = $TableName
    $table.TableStyle = "TableStyleMedium2"
    $table.ShowTableStyleRowStripes = $true
    Write-BuildLog "TABLE_$Name"

    $headerRange = $table.HeaderRowRange
    $headerRange.Interior.Color = $colors.Blue
    $headerRange.Font.Color = $colors.White
    $headerRange.Font.Bold = $true
    $headerRange.WrapText = $true
    $headerRange.HorizontalAlignment = -4108
    $sheet.Rows.Item(7).RowHeight = 36

    foreach ($header in $Headers) {
        $column = $table.ListColumns.Item($header)
        $width = if ($Widths.ContainsKey($header)) { [double]$Widths[$header] } else { 15 }
        $column.Range.ColumnWidth = $width
        if ($null -ne $column.DataBodyRange) {
            $column.DataBodyRange.Interior.Color = $colors.Input
            $column.DataBodyRange.WrapText = $true
        }
    }

    foreach ($columnName in $FormulaColumns.Keys) {
        $column = $table.ListColumns.Item($columnName)
        if ($null -ne $column.DataBodyRange) {
            $column.DataBodyRange.Formula = $FormulaColumns[$columnName]
            $column.DataBodyRange.Interior.Color = $colors.Formula
            $column.DataBodyRange.Font.Color = $colors.Navy
        }
    }
    Write-BuildLog "FORMULAS_$Name"

    foreach ($columnName in $Validations.Keys) {
        $column = $table.ListColumns.Item($columnName)
        if ($null -ne $column.DataBodyRange) {
            Add-ListValidation $column.DataBodyRange $Validations[$columnName]
        }
    }
    Write-BuildLog "VALIDATIONS_$Name"

    foreach ($columnName in $DateColumns) {
        $table.ListColumns.Item($columnName).Range.NumberFormat = "yyyy-mm-dd hh:mm"
    }
    foreach ($columnName in $NumberColumns) {
        $table.ListColumns.Item($columnName).Range.NumberFormat = "0.00"
    }
    foreach ($columnName in $PercentColumns) {
        $table.ListColumns.Item($columnName).Range.NumberFormat = "0.0%"
    }

    Set-CellBorder $table.Range $colors.Gray200
    $sheet.Range("A7").Select()
    $sheet.Application.ActiveWindow.FreezePanes = $false
    $sheet.Range("A8").Select()
    $sheet.Application.ActiveWindow.FreezePanes = $true
    $sheet.Rows.Item(6).RowHeight = 8
    $sheet.Columns.Item(1).HorizontalAlignment = -4131
    $sheet.PageSetup.Orientation = 2
    $sheet.PageSetup.Zoom = $false
    $sheet.PageSetup.FitToPagesWide = 1
    $sheet.PageSetup.FitToPagesTall = $false
    Write-BuildLog "END_$Name"
    return $sheet
}

function Add-StatusConditionalFormatting {
    param($Range)
    try { $Range.FormatConditions.Delete() } catch {}
    $green = $Range.FormatConditions.Add(1, 3, '="CERRADA"')
    $green.Interior.Color = $colors.GreenSoft
    $green.Font.Color = $colors.Green
    $red = $Range.FormatConditions.Add(1, 3, '="RECHAZADO"')
    $red.Interior.Color = $colors.RedSoft
    $red.Font.Color = $colors.Red
    $yellow = $Range.FormatConditions.Add(1, 3, '="POR VALIDAR"')
    $yellow.Interior.Color = $colors.Sand
    $yellow.Font.Color = $colors.Orange
}

New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$outputPath = Join-Path $OutputDirectory "VENTO_OPERACION_PILOTO.xlsm"
$previewDirectory = Join-Path $OutputDirectory "preview"
$buildLogPath = Join-Path $OutputDirectory "build-progress.log"
New-Item -ItemType Directory -Force -Path $previewDirectory | Out-Null
Set-Content -LiteralPath $buildLogPath -Value "$(Get-Date -Format o) START" -Encoding UTF8

function Write-BuildLog {
    param([string]$Message)
    Add-Content -LiteralPath $buildLogPath -Value "$(Get-Date -Format o) $Message" -Encoding UTF8
}

$excel = $null
$workbook = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.ScreenUpdating = $false
    $excel.EnableEvents = $false
    $workbook = $excel.Workbooks.Add()
    Write-BuildLog "WORKBOOK_CREATED"
    while ($workbook.Worksheets.Count -gt 1) {
        $workbook.Worksheets.Item($workbook.Worksheets.Count).Delete()
    }
    $homeSheet = $workbook.Worksheets.Item(1)
    $homeSheet.Name = "00_INICIO"

    $lists = $workbook.Worksheets.Add()
    $lists.Name = "99_LISTAS"
    $listData = [ordered]@{
        Sedes = @("Centro de Producción", "Vento Café", "Saudo", "Molka")
        EstadosSolicitud = @("BORRADOR", "SOLICITADA", "APROBADA", "EN PREPARACIÓN", "CERRADA", "CANCELADA")
        Prioridades = @("NORMAL", "ALTA", "URGENTE")
        EstadosRemision = @("BORRADOR", "PREPARACIÓN", "CARGADA", "DESPACHADA", "EN TRÁNSITO", "RECIBIDA", "CERRADA", "CANCELADA")
        Unidades = @("unidad", "kg", "g", "L", "mL", "caja", "bolsa", "paquete", "bandeja")
        MetodosConteo = @("CONTEO CIEGO", "CONTEO GUIADO", "RECONTEO", "CÍCLICO", "GENERAL")
        TiposMovimiento = @("INGRESO", "REUBICACIÓN", "CONSUMO", "TRASLADO", "SALIDA", "DEVOLUCIÓN", "AJUSTE DOCUMENTADO")
        EstadosOperacion = @("BORRADOR", "EN CURSO", "PENDIENTE", "CERRADA", "CANCELADA", "POR VALIDAR")
        Condiciones = @("CONFORME", "DAÑADO", "VENCIDO", "PRÓXIMO A VENCER", "CUARENTENA", "FRÍO FUERA DE RANGO", "NO CONFORME")
        Decisiones = @("ACEPTAR", "ACEPTAR PARCIAL", "CUARENTENA", "RECHAZAR", "DEVOLVER", "CORREGIR")
        TiposCalidadMerma = @("CONTROL DE CALIDAD", "TEMPERATURA", "VENCIMIENTO", "CUARENTENA", "MERMA", "PÉRDIDA", "REPROCESO")
        Disposiciones = @("LIBERAR", "RETENER", "RECHAZAR", "REPROCESAR", "DEVOLVER", "DESECHAR", "INVESTIGAR")
        PerfilesEstacion = @("CENTRO DE PRODUCCIÓN", "ESCÁNER DE ALMACÉN", "RECEPCIÓN Y MEDICIÓN", "DESPACHO Y ENTREGA", "POOL MÓVIL", "PANTALLA DE OBSERVACIÓN", "HOST DE PERIFÉRICOS")
        EstadosRegistro = @("PENDIENTE DE DEFINIR", "POR VALIDAR", "ACTIVO", "INACTIVO", "BLOQUEADO")
        TiposRetornable = @("CANASTILLA", "CAJA", "CONTENEDOR", "BANDEJA", "GARRAFA", "LPN", "OTRO")
        EstadosCalidad = @("PENDIENTE", "LIBERADO", "RETENIDO", "RECHAZADO", "CORREGIDO")
        SiNo = @("SÍ", "NO")
        MetodosRecepcion = @("CONTEO", "PESO", "VOLUMEN", "ESCANEO", "MIXTO")
    }

    $columnIndex = 1
    foreach ($entry in $listData.GetEnumerator()) {
        $lists.Cells.Item(1, $columnIndex).Value2 = $entry.Key
        for ($r = 0; $r -lt $entry.Value.Count; $r++) {
            $lists.Cells.Item(2 + $r, $columnIndex).Value2 = $entry.Value[$r]
        }
        $columnLetter = $lists.Cells.Item(1, $columnIndex).Address($false, $false) -replace '\d', ''
        $rangeRef = "='99_LISTAS'!`$$columnLetter`$2:`$$columnLetter`$$($entry.Value.Count + 1)"
        $workbook.Names.Add("lst" + $entry.Key, $rangeRef) | Out-Null
        $columnIndex++
    }
    $lists.Visible = $xlSheetVeryHidden
    Write-BuildLog "LISTS_CREATED"

    $catalogHeaders = @(
        "producto_id", "nombre_producto", "categoria", "presentacion_id", "presentacion",
        "unidad_base", "unidad_operativa", "factor_conversion", "controla_lote", "controla_vencimiento",
        "controla_frio", "temperatura_min_c", "temperatura_max_c", "es_retornable",
        "proveedor_referencia", "estado_registro", "fecha_alta", "responsable", "observaciones"
    )
    $catalogRows = @()
    for ($i = 1; $i -le 10; $i++) {
        $catalogRows += ,@(("PILOTO-PROD-{0:D3}" -f $i), "", "", "", "", "", "", "", "SÍ", "SÍ", "NO", "", "", "NO", "", "PENDIENTE DE DEFINIR", "", "", "")
    }
    $catalogWidths = @{
        producto_id = 19; nombre_producto = 26; categoria = 18; presentacion_id = 18; presentacion = 20;
        unidad_base = 15; unidad_operativa = 17; factor_conversion = 16; controla_lote = 15;
        controla_vencimiento = 19; controla_frio = 15; temperatura_min_c = 18; temperatura_max_c = 18;
        es_retornable = 15; proveedor_referencia = 22; estado_registro = 21; fecha_alta = 18;
        responsable = 20; observaciones = 32
    }
    $catalogValidations = @{
        unidad_base = "lstUnidades"; unidad_operativa = "lstUnidades"; controla_lote = "lstSiNo";
        controla_vencimiento = "lstSiNo"; controla_frio = "lstSiNo"; es_retornable = "lstSiNo";
        estado_registro = "lstEstadosRegistro"
    }
    $catalog = Add-TableSheet $workbook "01_CATALOGOS" "Catálogo maestro del piloto" `
        "Define producto, presentación y unidad sin mezclar conceptos. Los diez códigos iniciales son espacios del piloto, no datos productivos." `
        "Completa primero nombre, categoría, presentación y unidades. No reutilices un producto_id para otro producto." `
        "tblCatalogos" $catalogHeaders $catalogRows $catalogWidths $catalogValidations @{} @("fecha_alta") `
        @("factor_conversion", "temperatura_min_c", "temperatura_max_c") @()
    Write-BuildLog "SHEET_01"

    $locationHeaders = @(
        "ubicacion_id", "sede", "area", "zona", "punto", "tipo_ubicacion",
        "permite_inventario", "requiere_frio", "estado_registro", "responsable", "observaciones"
    )
    $locationRows = @(
        @("LOC-CP-REC", "Centro de Producción", "Recepción", "", "", "RECEPCIÓN", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-CP-ALM", "Centro de Producción", "Almacén", "", "", "ALMACÉN", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-CP-PRO", "Centro de Producción", "Producción", "", "", "PRODUCCIÓN", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-CP-DES", "Centro de Producción", "Despacho", "", "", "DESPACHO", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-VC-ALM", "Vento Café", "Almacén", "", "", "SATÉLITE", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-SAU-ALM", "Saudo", "Almacén", "", "", "SATÉLITE", "SÍ", "NO", "POR VALIDAR", "", ""),
        @("LOC-MOL-ALM", "Molka", "Almacén", "", "", "SATÉLITE", "SÍ", "NO", "POR VALIDAR", "", "")
    )
    $locationWidths = @{
        ubicacion_id = 18; sede = 23; area = 18; zona = 18; punto = 18; tipo_ubicacion = 18;
        permite_inventario = 18; requiere_frio = 15; estado_registro = 21; responsable = 20; observaciones = 32
    }
    $locationValidations = @{
        sede = "lstSedes"; permite_inventario = "lstSiNo"; requiere_frio = "lstSiNo"; estado_registro = "lstEstadosRegistro"
    }
    $locations = Add-TableSheet $workbook "02_UBICACIONES" "Sedes y ubicaciones físicas" `
        "Ubica cada movimiento en una sede y LOC concreta. Las ubicaciones propuestas deben validarse físicamente antes de marcarse ACTIVAS." `
        "Recorre cada sede, completa área/zona/punto y valida si permite inventario o requiere control de frío." `
        "tblUbicaciones" $locationHeaders $locationRows $locationWidths $locationValidations @{} @() @() @()
    Write-BuildLog "SHEET_02"

    $workbook.Names.Add("lstProductos", "='01_CATALOGOS'!`$A`$8:`$A`$200") | Out-Null
    $workbook.Names.Add("lstUbicaciones", "='02_UBICACIONES'!`$A`$8:`$A`$200") | Out-Null
    Write-BuildLog "DYNAMIC_LISTS_CREATED"

    $requestHeaders = @(
        "solicitud_id", "fecha_solicitud", "solicitante", "ubicacion_origen", "ubicacion_destino",
        "prioridad", "estado", "producto_id", "presentacion", "unidad", "cantidad_solicitada",
        "cantidad_aprobada", "aprobacion_pct", "fecha_necesidad", "responsable_aprobacion", "observaciones"
    )
    $requestWidths = @{
        solicitud_id = 19; fecha_solicitud = 19; solicitante = 20; ubicacion_origen = 20; ubicacion_destino = 20;
        prioridad = 13; estado = 20; producto_id = 19; presentacion = 18; unidad = 13;
        cantidad_solicitada = 18; cantidad_aprobada = 18; aprobacion_pct = 15; fecha_necesidad = 18;
        responsable_aprobacion = 23; observaciones = 32
    }
    $requestValidations = @{
        ubicacion_origen = "lstUbicaciones"; ubicacion_destino = "lstUbicaciones"; prioridad = "lstPrioridades";
        estado = "lstEstadosSolicitud"; producto_id = "lstProductos"; unidad = "lstUnidades"
    }
    $requestFormulas = @{
        aprobacion_pct = '=IF(OR(K8="",L8=""),"",IFERROR(L8/K8,0))'
    }
    $requests = Add-TableSheet $workbook "03_SOLICITUDES" "Solicitudes internas de abastecimiento" `
        "Una fila representa una línea de producto. Un mismo solicitud_id puede repetirse en varias líneas." `
        "Registra lo solicitado y lo aprobado por separado; nunca sustituyas la cantidad original para ocultar cambios." `
        "tblSolicitudes" $requestHeaders @() $requestWidths $requestValidations $requestFormulas `
        @("fecha_solicitud", "fecha_necesidad") @("cantidad_solicitada", "cantidad_aprobada") @("aprobacion_pct")
    Write-BuildLog "SHEET_03"

    $remissionHeaders = @(
        "remision_id", "solicitud_id", "fecha_despacho", "ubicacion_origen", "ubicacion_destino",
        "estado", "producto_id", "presentacion", "lote", "fecha_vencimiento", "unidad",
        "cantidad_solicitada", "cantidad_aprobada", "cantidad_preparada", "cantidad_cargada",
        "cantidad_despachada", "cantidad_recibida", "diferencia_recepcion", "cumplimiento_pct",
        "custodio_salida", "custodio_recepcion", "evidencia", "observaciones"
    )
    $remissionWidths = @{
        remision_id = 18; solicitud_id = 18; fecha_despacho = 19; ubicacion_origen = 20; ubicacion_destino = 20;
        estado = 18; producto_id = 19; presentacion = 18; lote = 16; fecha_vencimiento = 18; unidad = 13;
        cantidad_solicitada = 18; cantidad_aprobada = 18; cantidad_preparada = 18; cantidad_cargada = 17;
        cantidad_despachada = 19; cantidad_recibida = 18; diferencia_recepcion = 20; cumplimiento_pct = 16;
        custodio_salida = 20; custodio_recepcion = 20; evidencia = 28; observaciones = 32
    }
    $remissionValidations = @{
        ubicacion_origen = "lstUbicaciones"; ubicacion_destino = "lstUbicaciones";
        estado = "lstEstadosRemision"; producto_id = "lstProductos"; unidad = "lstUnidades"
    }
    $remissionFormulas = @{
        cantidad_recibida = '=IF(OR(A8="",G8=""),"",SUMIFS(''05_RECEPCIONES''!$I$8:$I$200,''05_RECEPCIONES''!$B$8:$B$200,A8,''05_RECEPCIONES''!$F$8:$F$200,G8,''05_RECEPCIONES''!$G$8:$G$200,I8))'
        diferencia_recepcion = '=IF(OR(P8="",Q8=""),"",Q8-P8)'
        cumplimiento_pct = '=IF(OR(P8="",Q8=""),"",IFERROR(Q8/P8,0))'
    }
    $remissions = Add-TableSheet $workbook "04_REMISIONES" "Preparación, despacho y recepción de remisiones" `
        "La remisión documenta la operación; no reemplaza el movimiento de inventario. Conserva solicitado, aprobado, preparado, cargado, despachado y recibido." `
        "Cambia el estado según el hecho real y adjunta evidencia. La cantidad recibida se calcula desde la hoja de recepciones." `
        "tblRemisiones" $remissionHeaders @() $remissionWidths $remissionValidations $remissionFormulas `
        @("fecha_despacho", "fecha_vencimiento") `
        @("cantidad_solicitada", "cantidad_aprobada", "cantidad_preparada", "cantidad_cargada", "cantidad_despachada", "cantidad_recibida", "diferencia_recepcion") `
        @("cumplimiento_pct")
    Write-BuildLog "SHEET_04"

    $receptionHeaders = @(
        "recepcion_id", "remision_id", "fecha_recepcion", "ubicacion_destino", "metodo_recepcion",
        "producto_id", "lote", "unidad", "cantidad_recibida", "cantidad_conforme", "cantidad_no_conforme",
        "temperatura_c", "condicion", "decision", "responsable", "evidencia", "observaciones"
    )
    $receptionWidths = @{
        recepcion_id = 18; remision_id = 18; fecha_recepcion = 19; ubicacion_destino = 20; metodo_recepcion = 18;
        producto_id = 19; lote = 16; unidad = 13; cantidad_recibida = 18; cantidad_conforme = 18;
        cantidad_no_conforme = 21; temperatura_c = 15; condicion = 22; decision = 18; responsable = 20;
        evidencia = 28; observaciones = 32
    }
    $receptionValidations = @{
        ubicacion_destino = "lstUbicaciones"; metodo_recepcion = "lstMetodosRecepcion";
        producto_id = "lstProductos"; unidad = "lstUnidades"; condicion = "lstCondiciones"; decision = "lstDecisiones"
    }
    $receptions = Add-TableSheet $workbook "05_RECEPCIONES" "Recepción física y conformidad" `
        "Registra el hecho observado: cantidad, condición, temperatura y evidencia. La recepción no debe sobrescribir lo despachado." `
        "Si existe no conformidad, conserva la cantidad y registra la decisión: cuarentena, rechazo, devolución o corrección." `
        "tblRecepciones" $receptionHeaders @() $receptionWidths $receptionValidations @{} `
        @("fecha_recepcion") @("cantidad_recibida", "cantidad_conforme", "cantidad_no_conforme", "temperatura_c") @()
    Write-BuildLog "SHEET_05"

    $countHeaders = @(
        "sesion_conteo_id", "fecha_corte", "sede", "ubicacion_id", "responsable", "metodo",
        "producto_id", "presentacion", "lote", "unidad", "cantidad_sistema_referencia",
        "cantidad_contada", "diferencia", "investigacion", "documento_ajuste_id", "estado", "evidencia", "observaciones"
    )
    $countWidths = @{
        sesion_conteo_id = 20; fecha_corte = 19; sede = 22; ubicacion_id = 19; responsable = 20; metodo = 18;
        producto_id = 19; presentacion = 18; lote = 16; unidad = 13; cantidad_sistema_referencia = 25;
        cantidad_contada = 18; diferencia = 15; investigacion = 30; documento_ajuste_id = 21;
        estado = 18; evidencia = 28; observaciones = 32
    }
    $countValidations = @{
        sede = "lstSedes"; ubicacion_id = "lstUbicaciones"; metodo = "lstMetodosConteo";
        producto_id = "lstProductos"; unidad = "lstUnidades"; estado = "lstEstadosOperacion"
    }
    $countFormulas = @{
        diferencia = '=IF(OR(K8="",L8=""),"",L8-K8)'
    }
    $counts = Add-TableSheet $workbook "06_CONTEOS" "Sesiones de conteo físico" `
        "El conteo es una observación con corte, método y responsable. Una diferencia no modifica inventario por sí sola." `
        "Investiga toda diferencia y vincula un documento de ajuste independiente solo cuando corresponda." `
        "tblConteos" $countHeaders @() $countWidths $countValidations $countFormulas `
        @("fecha_corte") @("cantidad_sistema_referencia", "cantidad_contada", "diferencia") @()
    Write-BuildLog "SHEET_06"

    $movementHeaders = @(
        "movimiento_id", "fecha_movimiento", "tipo_movimiento", "ubicacion_origen", "ubicacion_destino",
        "producto_id", "presentacion", "lote", "unidad", "cantidad", "custodio_salida",
        "custodio_entrada", "documento_relacionado_id", "responsable", "evidencia", "estado", "observaciones"
    )
    $movementWidths = @{
        movimiento_id = 19; fecha_movimiento = 19; tipo_movimiento = 21; ubicacion_origen = 20;
        ubicacion_destino = 20; producto_id = 19; presentacion = 18; lote = 16; unidad = 13;
        cantidad = 15; custodio_salida = 20; custodio_entrada = 20; documento_relacionado_id = 24;
        responsable = 20; evidencia = 28; estado = 18; observaciones = 32
    }
    $movementValidations = @{
        tipo_movimiento = "lstTiposMovimiento"; ubicacion_origen = "lstUbicaciones"; ubicacion_destino = "lstUbicaciones";
        producto_id = "lstProductos"; unidad = "lstUnidades"; estado = "lstEstadosOperacion"
    }
    $movements = Add-TableSheet $workbook "07_MOVIMIENTOS" "Movimientos físicos y custodia" `
        "Registra ingresos, reubicaciones, consumos, traslados, salidas y devoluciones con origen, destino, lote y custodia." `
        "Todo ajuste debe estar documentado. No utilices un movimiento para corregir silenciosamente un conteo." `
        "tblMovimientos" $movementHeaders @() $movementWidths $movementValidations @{} `
        @("fecha_movimiento") @("cantidad") @()
    Write-BuildLog "SHEET_07"

    $productionHeaders = @(
        "orden_produccion_id", "fecha_produccion", "receta_id", "version_receta", "lote_salida",
        "estado_produccion", "estado_calidad", "producto_insumo_id", "lote_insumo", "unidad_insumo",
        "cantidad_insumo", "producto_salida_id", "unidad_salida", "salida_total", "salida_buena",
        "reproceso", "merma", "rendimiento_pct", "responsable", "evidencia", "observaciones"
    )
    $productionWidths = @{
        orden_produccion_id = 22; fecha_produccion = 19; receta_id = 18; version_receta = 16; lote_salida = 16;
        estado_produccion = 20; estado_calidad = 18; producto_insumo_id = 21; lote_insumo = 16;
        unidad_insumo = 16; cantidad_insumo = 17; producto_salida_id = 21; unidad_salida = 15;
        salida_total = 15; salida_buena = 15; reproceso = 14; merma = 14; rendimiento_pct = 16;
        responsable = 20; evidencia = 28; observaciones = 32
    }
    $productionValidations = @{
        estado_produccion = "lstEstadosOperacion"; estado_calidad = "lstEstadosCalidad";
        producto_insumo_id = "lstProductos"; producto_salida_id = "lstProductos";
        unidad_insumo = "lstUnidades"; unidad_salida = "lstUnidades"
    }
    $productionFormulas = @{
        rendimiento_pct = '=IF(OR(N8="",O8=""),"",IFERROR(O8/N8,0))'
    }
    $production = Add-TableSheet $workbook "08_PRODUCCION" "Producción, rendimiento y trazabilidad" `
        "Conserva receta/version, insumos reales, lote de salida, resultado, reproceso y merma. Terminado no significa liberado." `
        "Registra una fila por combinación de orden e insumo/salida. Calidad decide la liberación en un estado separado." `
        "tblProduccion" $productionHeaders @() $productionWidths $productionValidations $productionFormulas `
        @("fecha_produccion") @("cantidad_insumo", "salida_total", "salida_buena", "reproceso", "merma") @("rendimiento_pct")
    Write-BuildLog "SHEET_08"

    $qualityHeaders = @(
        "evento_id", "fecha_evento", "tipo_evento", "ubicacion_id", "producto_id", "lote",
        "fecha_vencimiento", "condicion", "temperatura_c", "cantidad_afectada", "unidad",
        "disposicion", "documento_relacionado_id", "responsable", "evidencia", "estado", "observaciones"
    )
    $qualityWidths = @{
        evento_id = 18; fecha_evento = 19; tipo_evento = 21; ubicacion_id = 19; producto_id = 19;
        lote = 16; fecha_vencimiento = 18; condicion = 22; temperatura_c = 15; cantidad_afectada = 19;
        unidad = 13; disposicion = 18; documento_relacionado_id = 24; responsable = 20;
        evidencia = 28; estado = 18; observaciones = 32
    }
    $qualityValidations = @{
        tipo_evento = "lstTiposCalidadMerma"; ubicacion_id = "lstUbicaciones"; producto_id = "lstProductos";
        condicion = "lstCondiciones"; unidad = "lstUnidades"; disposicion = "lstDisposiciones"; estado = "lstEstadosOperacion"
    }
    $quality = Add-TableSheet $workbook "09_CALIDAD_MERMAS" "Calidad, frío, vencimientos y mermas" `
        "Registra condición, temperatura, cantidad afectada y disposición sin borrar el hecho original." `
        "La cuarentena, liberación, rechazo, reproceso o desecho deben quedar explícitos y con evidencia." `
        "tblCalidadMermas" $qualityHeaders @() $qualityWidths $qualityValidations @{} `
        @("fecha_evento", "fecha_vencimiento") @("temperatura_c", "cantidad_afectada") @()
    Write-BuildLog "SHEET_09"

    $returnableHeaders = @(
        "movimiento_retornable_id", "fecha_movimiento", "tipo_retornable", "unidad_identificada_lpn",
        "ubicacion_origen", "ubicacion_destino", "cantidad_salida", "cantidad_recibida", "diferencia",
        "custodio_salida", "custodio_recepcion", "estado", "evidencia", "observaciones"
    )
    $returnableWidths = @{
        movimiento_retornable_id = 25; fecha_movimiento = 19; tipo_retornable = 18;
        unidad_identificada_lpn = 23; ubicacion_origen = 20; ubicacion_destino = 20;
        cantidad_salida = 17; cantidad_recibida = 18; diferencia = 15; custodio_salida = 20;
        custodio_recepcion = 20; estado = 18; evidencia = 28; observaciones = 32
    }
    $returnableValidations = @{
        tipo_retornable = "lstTiposRetornable"; ubicacion_origen = "lstUbicaciones";
        ubicacion_destino = "lstUbicaciones"; estado = "lstEstadosOperacion"
    }
    $returnableFormulas = @{
        diferencia = '=IF(OR(G8="",H8=""),"",H8-G8)'
    }
    $returnables = Add-TableSheet $workbook "10_RETORNABLES" "Retornables, LPN y custodia" `
        "Controla canastillas, cajas, contenedores y otras unidades retornables como activos en custodia." `
        "Registra salida y recepción por separado; investiga cualquier diferencia antes de cerrar." `
        "tblRetornables" $returnableHeaders @() $returnableWidths $returnableValidations $returnableFormulas `
        @("fecha_movimiento") @("cantidad_salida", "cantidad_recibida", "diferencia") @()
    Write-BuildLog "SHEET_10"

    $stationHeaders = @(
        "estacion_id", "sede", "area", "zona", "punto", "perfil_estacion", "proceso_principal",
        "actor_principal", "picos_operativos", "movilidad", "interaccion_ambiental", "dispositivo",
        "tipo_sesion", "perifericos", "infraestructura", "contingencia", "evidencia", "estado_registro", "observaciones"
    )
    $stationWidths = @{
        estacion_id = 18; sede = 22; area = 18; zona = 18; punto = 18; perfil_estacion = 25;
        proceso_principal = 24; actor_principal = 20; picos_operativos = 22; movilidad = 18;
        interaccion_ambiental = 25; dispositivo = 22; tipo_sesion = 18; perifericos = 25;
        infraestructura = 25; contingencia = 30; evidencia = 28; estado_registro = 21; observaciones = 32
    }
    $stationValidations = @{
        sede = "lstSedes"; perfil_estacion = "lstPerfilesEstacion"; estado_registro = "lstEstadosRegistro"
    }
    $stations = Add-TableSheet $workbook "11_ESTACIONES" "Inventario de estaciones operativas" `
        "Describe el puesto real: lugar, proceso, actor, movilidad, ambiente, dispositivo, sesión, periféricos, infraestructura y contingencia." `
        "Haz el recorrido físico y registra evidencia. No marques ACTIVO sin validar conectividad, energía y forma de contingencia." `
        "tblEstaciones" $stationHeaders @() $stationWidths $stationValidations @{} @() @() @()
    Write-BuildLog "SHEET_11"

    Write-BuildLog "TABLE_STYLES_READY"

    $panel = $workbook.Worksheets.Add()
    $panel.Name = "12_PANEL"
    Set-SheetHeader $panel "Panel operativo del piloto" `
        "Indicadores automáticos para priorizar pendientes. Un cero significa que no hay registros o alertas en la plantilla." `
        12 "Pulsa ACTUALIZAR para recalcular. Revisa primero diferencias, tránsito, calidad y estaciones pendientes."
    Add-StandardButtons $panel $false
    $panel.Range("A7:L7").Merge()
    $panel.Range("A7").Value2 = "ESTADO OPERATIVO"
    $panel.Range("A7:L7").Interior.Color = $colors.Teal
    $panel.Range("A7:L7").Font.Color = $colors.White
    $panel.Range("A7:L7").Font.Bold = $true
    $panel.Range("A7:L7").HorizontalAlignment = -4108

    $kpis = @(
        @("Productos activos", '=COUNTIF(''01_CATALOGOS''!$P$8:$P$200,"ACTIVO")', $colors.Blue),
        @("Solicitudes abiertas", '=COUNTIFS(''03_SOLICITUDES''!$A$8:$A$200,"<>",''03_SOLICITUDES''!$G$8:$G$200,"<>CERRADA",''03_SOLICITUDES''!$G$8:$G$200,"<>CANCELADA")', $colors.Teal),
        @("Remisiones en tránsito", '=COUNTIF(''04_REMISIONES''!$F$8:$F$200,"EN TRÁNSITO")', $colors.Orange),
        @("Diferencias recepción", '=COUNTIFS(''04_REMISIONES''!$A$8:$A$200,"<>",''04_REMISIONES''!$R$8:$R$200,"<>0")', $colors.Red),
        @("Diferencias de conteo", '=COUNTIFS(''06_CONTEOS''!$A$8:$A$200,"<>",''06_CONTEOS''!$M$8:$M$200,"<>0")', $colors.Red),
        @("Alertas calidad", '=COUNTIFS(''09_CALIDAD_MERMAS''!$A$8:$A$200,"<>",''09_CALIDAD_MERMAS''!$P$8:$P$200,"<>CERRADA",''09_CALIDAD_MERMAS''!$P$8:$P$200,"<>CANCELADA")', $colors.Orange),
        @("Estaciones por validar", '=COUNTIF(''11_ESTACIONES''!$R$8:$R$200,"POR VALIDAR")', $colors.Blue),
        @("Rendimiento promedio", '=IFERROR(AVERAGE(''08_PRODUCCION''!$R$8:$R$200),0)', $colors.Green)
    )
    $positions = @(
        @(9, 1), @(9, 4), @(9, 7), @(9, 10),
        @(13, 1), @(13, 4), @(13, 7), @(13, 10)
    )
    for ($i = 0; $i -lt $kpis.Count; $i++) {
        $row = $positions[$i][0]
        $col = $positions[$i][1]
        $range = $panel.Range($panel.Cells.Item($row, $col), $panel.Cells.Item($row + 2, $col + 1))
        $range.Merge()
        $range.Interior.Color = $colors.Gray50
        Set-CellBorder $range $colors.Gray200
        $range.HorizontalAlignment = -4108
        $range.VerticalAlignment = -4108
        $range.WrapText = $true
        $range.Font.Color = $colors.Gray500
        $range.Font.Size = 10
        $range.Value2 = $kpis[$i][0]
        $valueRange = $panel.Range($panel.Cells.Item($row + 1, $col), $panel.Cells.Item($row + 2, $col + 1))
        $valueRange.Merge()
        $valueRange.Formula = $kpis[$i][1]
        $valueRange.Font.Size = 23
        $valueRange.Font.Bold = $true
        $valueRange.Font.Color = $kpis[$i][2]
        if ($kpis[$i][0] -eq "Rendimiento promedio") {
            $valueRange.NumberFormat = "0.0%"
        } else {
            $valueRange.NumberFormat = "0"
        }
    }

    $panel.Range("A18:D23").Value2 = @(
        @("Indicador", "Valor", $null, $null),
        @("Solicitudes abiertas", $null, $null, $null),
        @("Remisiones en tránsito", $null, $null, $null),
        @("Diferencias recepción", $null, $null, $null),
        @("Diferencias conteo", $null, $null, $null),
        @("Alertas calidad", $null, $null, $null)
    )
    $panel.Range("B19").Formula = '=COUNTIFS(''03_SOLICITUDES''!$A$8:$A$200,"<>",''03_SOLICITUDES''!$G$8:$G$200,"<>CERRADA",''03_SOLICITUDES''!$G$8:$G$200,"<>CANCELADA")'
    $panel.Range("B20").Formula = '=COUNTIF(''04_REMISIONES''!$F$8:$F$200,"EN TRÁNSITO")'
    $panel.Range("B21").Formula = '=COUNTIFS(''04_REMISIONES''!$A$8:$A$200,"<>",''04_REMISIONES''!$R$8:$R$200,"<>0")'
    $panel.Range("B22").Formula = '=COUNTIFS(''06_CONTEOS''!$A$8:$A$200,"<>",''06_CONTEOS''!$M$8:$M$200,"<>0")'
    $panel.Range("B23").Formula = '=COUNTIFS(''09_CALIDAD_MERMAS''!$A$8:$A$200,"<>",''09_CALIDAD_MERMAS''!$P$8:$P$200,"<>CERRADA",''09_CALIDAD_MERMAS''!$P$8:$P$200,"<>CANCELADA")'
    $panel.Range("A18:B18").Interior.Color = $colors.Navy
    $panel.Range("A18:B18").Font.Color = $colors.White
    $panel.Range("A18:B18").Font.Bold = $true
    $panel.Range("A18:B23").Borders.LineStyle = 1
    $panel.Columns.Item("A").ColumnWidth = 24
    $panel.Columns.Item("B").ColumnWidth = 14
    for ($c = 3; $c -le 12; $c++) { $panel.Columns.Item($c).ColumnWidth = 12 }

    $chartObject = $panel.ChartObjects().Add(350, 325, 520, 260)
    $chart = $chartObject.Chart
    $chart.SetSourceData($panel.Range("A18:B23"))
    $chart.ChartType = $xlColumnClustered
    $chart.HasTitle = $true
    $chart.ChartTitle.Text = "Pendientes y alertas actuales"
    $chart.HasLegend = $false
    $chart.ChartStyle = 201
    Write-BuildLog "PANEL_CREATED"

    $homeSheet.Cells.Clear()
    $homeSheet.Activate()
    $excel.ActiveWindow.DisplayGridlines = $false
    $homeSheet.Cells.Font.Name = "Aptos"
    $homeSheet.Range("A1:L3").Merge()
    $homeSheet.Range("A1").Value2 = "VENTO · OPERACIÓN PILOTO"
    $homeSheet.Range("A1:L3").Interior.Color = $colors.Navy
    $homeSheet.Range("A1:L3").Font.Color = $colors.White
    $homeSheet.Range("A1:L3").Font.Bold = $true
    $homeSheet.Range("A1:L3").Font.Size = 27
    $homeSheet.Range("A1:L3").HorizontalAlignment = -4108
    $homeSheet.Range("A1:L3").VerticalAlignment = -4108
    $homeSheet.Rows.Item("1:3").RowHeight = 30

    $homeSheet.Range("A5:L6").Merge()
    $homeSheet.Range("A5").Value2 = "Libro local para preparar Centro de Producción y satélites con la misma lógica futura de NEXO. No actualiza Supabase ni certifica implementación."
    $homeSheet.Range("A5:L6").Interior.Color = $colors.Sky
    $homeSheet.Range("A5:L6").Font.Color = $colors.Gray800
    $homeSheet.Range("A5:L6").Font.Size = 12
    $homeSheet.Range("A5:L6").WrapText = $true
    $homeSheet.Range("A5:L6").HorizontalAlignment = -4108

    $homeSheet.Range("A8:F8").Merge()
    $homeSheet.Range("A8").Value2 = "FLUJO DIARIO RECOMENDADO"
    $homeSheet.Range("A8:F8").Interior.Color = $colors.Teal
    $homeSheet.Range("A8:F8").Font.Color = $colors.White
    $homeSheet.Range("A8:F8").Font.Bold = $true
    $homeSheet.Range("A8:F8").HorizontalAlignment = -4108

    $steps = @(
        "1. Completa catálogos y valida ubicaciones.",
        "2. Registra la solicitud sin reemplazar cantidades.",
        "3. Prepara y despacha la remisión por etapas.",
        "4. Recibe físicamente y documenta diferencias.",
        "5. Registra movimientos, conteos y producción.",
        "6. Revisa el panel y cierra solo con evidencia."
    )
    for ($i = 0; $i -lt $steps.Count; $i++) {
        $homeSheet.Range("A$($i + 9):F$($i + 9)").Merge()
        $homeSheet.Range("A$($i + 9)").Value2 = $steps[$i]
        $homeSheet.Range("A$($i + 9):F$($i + 9)").Interior.Color = if ($i % 2 -eq 0) { $colors.Gray50 } else { $colors.White }
        $homeSheet.Range("A$($i + 9):F$($i + 9)").Font.Color = $colors.Gray800
        $homeSheet.Rows.Item($i + 9).RowHeight = 26
    }
    Set-CellBorder $homeSheet.Range("A8:F14") $colors.Gray200

    $homeSheet.Range("H8:L8").Merge()
    $homeSheet.Range("H8").Value2 = "REGLAS QUE EVITAN PÉRDIDA DE INFORMACIÓN"
    $homeSheet.Range("H8:L8").Interior.Color = $colors.Orange
    $homeSheet.Range("H8:L8").Font.Color = $colors.White
    $homeSheet.Range("H8:L8").Font.Bold = $true
    $homeSheet.Range("H8:L8").HorizontalAlignment = -4108
    $rules = @(
        "• Un código estable nunca se reutiliza.",
        "• Una fila representa un hecho o línea.",
        "• No borres: corrige con documento relacionado.",
        "• Conteo y ajuste son hechos distintos.",
        "• Terminado y liberado son estados distintos.",
        "• No guardes claves, PIN, pagos ni datos sensibles."
    )
    for ($i = 0; $i -lt $rules.Count; $i++) {
        $homeSheet.Range("H$($i + 9):L$($i + 9)").Merge()
        $homeSheet.Range("H$($i + 9)").Value2 = $rules[$i]
        $homeSheet.Range("H$($i + 9):L$($i + 9)").Interior.Color = if ($i % 2 -eq 0) { $colors.Sand } else { $colors.White }
        $homeSheet.Range("H$($i + 9):L$($i + 9)").Font.Color = $colors.Gray800
        $homeSheet.Rows.Item($i + 9).RowHeight = 26
    }
    Set-CellBorder $homeSheet.Range("H8:L14") $colors.Gray200

    $homeSheet.Range("A17:L17").Merge()
    $homeSheet.Range("A17").Value2 = "ABRIR MÓDULO"
    $homeSheet.Range("A17:L17").Interior.Color = $colors.Navy
    $homeSheet.Range("A17:L17").Font.Color = $colors.White
    $homeSheet.Range("A17:L17").Font.Bold = $true
    $homeSheet.Range("A17:L17").HorizontalAlignment = -4108

    $menuItems = @(
        @("CATÁLOGOS", "01_CATALOGOS", $colors.Blue),
        @("UBICACIONES", "02_UBICACIONES", $colors.Blue),
        @("SOLICITUDES", "03_SOLICITUDES", $colors.Teal),
        @("REMISIONES", "04_REMISIONES", $colors.Teal),
        @("RECEPCIONES", "05_RECEPCIONES", $colors.Teal),
        @("CONTEOS", "06_CONTEOS", $colors.Orange),
        @("MOVIMIENTOS", "07_MOVIMIENTOS", $colors.Orange),
        @("PRODUCCIÓN", "08_PRODUCCION", $colors.Orange),
        @("CALIDAD Y MERMAS", "09_CALIDAD_MERMAS", $colors.Red),
        @("RETORNABLES", "10_RETORNABLES", $colors.Red),
        @("ESTACIONES", "11_ESTACIONES", $colors.Blue),
        @("PANEL", "12_PANEL", $colors.Green)
    )
    for ($i = 0; $i -lt $menuItems.Count; $i++) {
        $row = [Math]::Floor($i / 3)
        $col = $i % 3
        $left = 18 + ($col * 245)
        $top = 360 + ($row * 48)
        $null = Add-ActionButton $homeSheet $menuItems[$i][0] $left $top 210 "IrAHoja" $menuItems[$i][2] $menuItems[$i][1]
    }

    for ($c = 1; $c -le 12; $c++) { $homeSheet.Columns.Item($c).ColumnWidth = 12 }
    $homeSheet.Range("A1").Select()
    $homeSheet.PageSetup.Orientation = 1
    $homeSheet.PageSetup.Zoom = $false
    $homeSheet.PageSetup.FitToPagesWide = 1
    $homeSheet.PageSetup.FitToPagesTall = 1
    Write-BuildLog "HOME_CREATED"

    $vbaModule = @'
Option Explicit

Public Sub IrAInicio()
    ThisWorkbook.Worksheets("00_INICIO").Activate
    ActiveWindow.ScrollRow = 1
    ActiveWindow.ScrollColumn = 1
End Sub

Public Sub IrAHoja()
    Dim nombreBoton As String
    Dim destino As String
    nombreBoton = Application.Caller
    destino = ActiveSheet.Shapes(nombreBoton).AlternativeText
    If Len(destino) > 0 Then
        ThisWorkbook.Worksheets(destino).Activate
        ActiveWindow.ScrollRow = 1
        ActiveWindow.ScrollColumn = 1
    End If
End Sub

Public Sub NuevoRegistro()
    Dim tabla As ListObject
    Dim fila As ListRow
    If ActiveSheet.ListObjects.Count = 0 Then
        MsgBox "Esta hoja no contiene una tabla de captura.", vbInformation, "VENTO"
        Exit Sub
    End If
    Set tabla = ActiveSheet.ListObjects(1)
    Set fila = tabla.ListRows.Add
    fila.Range.Cells(1, 1).Select
    MsgBox "Fila nueva creada. Completa el código estable y los campos amarillos.", vbInformation, "VENTO"
End Sub

Public Sub LimpiarFiltros()
    Dim tabla As ListObject
    On Error Resume Next
    For Each tabla In ActiveSheet.ListObjects
        tabla.AutoFilter.ShowAllData
    Next tabla
    On Error GoTo 0
End Sub

Public Sub ActualizarPanel()
    Application.ScreenUpdating = False
    Application.CalculateFull
    ThisWorkbook.Worksheets("12_PANEL").Calculate
    Application.ScreenUpdating = True
    If ActiveSheet.Name = "12_PANEL" Then
        MsgBox "Indicadores actualizados.", vbInformation, "VENTO"
    End If
End Sub
'@
    $module = $workbook.VBProject.VBComponents.Add(1)
    $module.Name = "modVentoOperacion"
    $module.CodeModule.AddFromString($vbaModule)

    $thisWorkbookCode = @'
Option Explicit

Private Sub Workbook_Open()
    Application.CalculateFull
    Worksheets("00_INICIO").Activate
    ActiveWindow.ScrollRow = 1
    ActiveWindow.ScrollColumn = 1
End Sub
'@
    $workbook.VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString($thisWorkbookCode)
    Write-BuildLog "VBA_CREATED"

    $documentSheetNames = @(
        "00_INICIO", "01_CATALOGOS", "02_UBICACIONES", "03_SOLICITUDES", "04_REMISIONES",
        "05_RECEPCIONES", "06_CONTEOS", "07_MOVIMIENTOS", "08_PRODUCCION", "09_CALIDAD_MERMAS",
        "10_RETORNABLES", "11_ESTACIONES", "12_PANEL"
    )
    foreach ($sheetName in $documentSheetNames) {
        $sheet = $workbook.Worksheets.Item($sheetName)
        $sheet.Tab.Color = switch -Regex ($sheetName) {
            "^00" { $colors.Navy; break }
            "^0[1-2]" { $colors.Blue; break }
            "^0[3-5]" { $colors.Teal; break }
            "^0[6-8]" { $colors.Orange; break }
            "^0[9]|^10" { $colors.Red; break }
            "^11" { $colors.Blue; break }
            "^12" { $colors.Green; break }
            default { $colors.Gray500 }
        }
    }

    $orderedNames = @(
        "00_INICIO", "01_CATALOGOS", "02_UBICACIONES", "03_SOLICITUDES", "04_REMISIONES",
        "05_RECEPCIONES", "06_CONTEOS", "07_MOVIMIENTOS", "08_PRODUCCION", "09_CALIDAD_MERMAS",
        "10_RETORNABLES", "11_ESTACIONES", "12_PANEL", "99_LISTAS"
    )
    for ($i = $orderedNames.Count - 1; $i -ge 0; $i--) {
        $sheetToMove = $workbook.Worksheets.Item($orderedNames[$i])
        if ($sheetToMove.Index -ne 1) {
            $sheetToMove.Move($workbook.Worksheets.Item(1))
        }
    }
    Write-BuildLog "SHEETS_ORDERED"

    $workbook.Worksheets.Item("00_INICIO").Activate()
    $excel.ScreenUpdating = $true
    $excel.CalculateFull()
    if (Test-Path $outputPath) {
        Remove-Item -LiteralPath $outputPath -Force
    }
    Write-BuildLog "BEFORE_SAVE"
    $workbook.SaveAs($outputPath, $xlOpenXMLWorkbookMacroEnabled)
    $workbook.Save()
    Write-BuildLog "SAVED"

    $verification = [ordered]@{
        output = $outputPath
        sheets = @()
        tables = @()
        macros = $workbook.VBProject.VBComponents.Item("modVentoOperacion").CodeModule.CountOfLines
        formula_errors = @()
    }

    foreach ($sheetName in $documentSheetNames) {
        $sheet = $workbook.Worksheets.Item($sheetName)
        $used = $sheet.UsedRange
        $verification.sheets += [ordered]@{
            name = $sheetName
            rows = $used.Rows.Count
            columns = $used.Columns.Count
            shapes = $sheet.Shapes.Count
        }
        foreach ($table in $sheet.ListObjects) {
            $verification.tables += [ordered]@{
                sheet = $sheetName
                name = $table.Name
                rows = $table.ListRows.Count
                columns = $table.ListColumns.Count
            }
        }
        foreach ($cell in $used.Cells) {
            if ($cell.HasFormula -and ($cell.Text -match "^#(REF|DIV/0|VALUE|NAME|N/A|NUM|NULL)")) {
                $verification.formula_errors += "$sheetName!$($cell.Address($false, $false))=$($cell.Text)"
            }
        }
    }

    $verification | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $OutputDirectory "verification.json") -Encoding UTF8
    Write-BuildLog "VERIFIED"

    foreach ($sheetName in @("00_INICIO", "03_SOLICITUDES", "04_REMISIONES", "08_PRODUCCION", "12_PANEL")) {
        $sheet = $workbook.Worksheets.Item($sheetName)
        $sheet.Activate()
        $sheet.UsedRange.CopyPicture(1, 2)
        $width = [Math]::Min(1600, [Math]::Max(900, $sheet.UsedRange.Width))
        $height = [Math]::Min(900, [Math]::Max(500, $sheet.UsedRange.Height))
        $chartObject = $sheet.ChartObjects().Add(0, 0, $width, $height)
        $chartObject.Chart.Paste()
        $previewPath = Join-Path $previewDirectory ($sheetName + ".png")
        $chartObject.Chart.Export($previewPath, "PNG") | Out-Null
        $chartObject.Delete()
    }
    Write-BuildLog "PREVIEWS_EXPORTED"

    $workbook.Worksheets.Item("00_INICIO").Activate()
    $workbook.Save()
    Write-BuildLog "COMPLETE"
}
finally {
    if ($null -ne $workbook) {
        try { $workbook.Close($true) } catch {}
        [System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($workbook) | Out-Null
    }
    if ($null -ne $excel) {
        try { $excel.Quit() } catch {}
        [System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel) | Out-Null
    }
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}

Write-Output $outputPath
