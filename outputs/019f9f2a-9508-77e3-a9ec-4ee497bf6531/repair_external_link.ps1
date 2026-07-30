param(
    [string]$InputPath = (Join-Path $PSScriptRoot "VENTO_OPERACION_PILOTO.xlsm"),
    [string]$OutputPath = (Join-Path $PSScriptRoot "VENTO_OPERACION_PILOTO_CORREGIDO.xlsm")
)

$ErrorActionPreference = "Stop"
$xlLinkTypeExcelLinks = 1
$xlExcelLinks = 1
$xlOpenXMLWorkbookMacroEnabled = 52

$excel = $null
$workbook = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.AskToUpdateLinks = $false
    $excel.AutomationSecurity = 3

    $workbook = $excel.Workbooks.Open($InputPath, 0, $true)
    $remissions = $workbook.Worksheets.Item("04_REMISIONES")
    $table = $remissions.ListObjects.Item("tblRemisiones")
    $receivedColumn = $table.ListColumns.Item("cantidad_recibida").DataBodyRange

    foreach ($cell in $receivedColumn.Cells) {
        $row = $cell.Row
        $cell.Formula = "=IF(OR(A$row="""",G$row=""""),"""",SUMIFS('05_RECEPCIONES'!`$I`$8:`$I`$200,'05_RECEPCIONES'!`$B`$8:`$B`$200,A$row,'05_RECEPCIONES'!`$F`$8:`$F`$200,G$row,'05_RECEPCIONES'!`$G`$8:`$G`$200,I$row))"
    }

    $linksBeforeBreak = $workbook.LinkSources($xlLinkTypeExcelLinks)
    if ($null -ne $linksBeforeBreak) {
        foreach ($link in $linksBeforeBreak) {
            if ($link -match "05_RECEPCIONES") {
                $workbook.BreakLink($link, $xlExcelLinks)
            }
        }
    }

    $excel.CalculateFull()
    $workbook.SaveAs($OutputPath, $xlOpenXMLWorkbookMacroEnabled)
}
finally {
    if ($null -ne $workbook) {
        try { $workbook.Close($false) } catch {}
        [Runtime.InteropServices.Marshal]::FinalReleaseComObject($workbook) | Out-Null
    }
    if ($null -ne $excel) {
        try { $excel.Quit() } catch {}
        [Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel) | Out-Null
    }
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}

Write-Output $OutputPath
