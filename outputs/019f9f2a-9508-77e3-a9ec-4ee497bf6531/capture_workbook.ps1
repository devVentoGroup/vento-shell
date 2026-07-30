param(
    [string]$WorkbookPath = (Join-Path $PSScriptRoot "VENTO_OPERACION_PILOTO.xlsm"),
    [string]$CaptureDirectory = (Join-Path $PSScriptRoot "visual")
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing.Common
Add-Type @"
using System;
using System.Runtime.InteropServices;
public static class VentoWindowCapture {
    [StructLayout(LayoutKind.Sequential)]
    public struct RECT {
        public int Left;
        public int Top;
        public int Right;
        public int Bottom;
    }

    [DllImport("user32.dll")]
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool PrintWindow(IntPtr hWnd, IntPtr hdcBlt, uint nFlags);
}
"@

New-Item -ItemType Directory -Path $CaptureDirectory -Force | Out-Null

$excel = $null
$workbook = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $true
    $excel.DisplayAlerts = $false
    $excel.ScreenUpdating = $true
    $excel.AutomationSecurity = 3
    $workbook = $excel.Workbooks.Open($WorkbookPath, 0, $true)
    $null = [VentoWindowCapture]::ShowWindow([IntPtr]$excel.Hwnd, 3)
    Start-Sleep -Milliseconds 800

    foreach ($sheet in $workbook.Worksheets) {
        if ($sheet.Visible -ne -1) {
            continue
        }
        $sheet.Activate()
        $excel.ActiveWindow.ScrollRow = 1
        $excel.ActiveWindow.ScrollColumn = 1
        $excel.ActiveWindow.Zoom = if ($sheet.Name -eq "00_INICIO" -or $sheet.Name -eq "12_PANEL") { 80 } else { 60 }
        Start-Sleep -Milliseconds 500

        $rect = New-Object VentoWindowCapture+RECT
        if (-not [VentoWindowCapture]::GetWindowRect([IntPtr]$excel.Hwnd, [ref]$rect)) {
            throw "No fue posible obtener el área visual de Excel."
        }
        $width = $rect.Right - $rect.Left
        $height = $rect.Bottom - $rect.Top
        $bitmap = New-Object System.Drawing.Bitmap($width, $height)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        try {
            $hdc = $graphics.GetHdc()
            try {
                if (-not [VentoWindowCapture]::PrintWindow([IntPtr]$excel.Hwnd, $hdc, 2)) {
                    throw "Windows no pudo capturar directamente la ventana de Excel."
                }
            }
            finally {
                $graphics.ReleaseHdc($hdc)
            }
            $path = Join-Path $CaptureDirectory ($sheet.Name + ".png")
            $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        }
        finally {
            $graphics.Dispose()
            $bitmap.Dispose()
        }
    }
}
finally {
    if ($null -ne $workbook) {
        try { $workbook.Close($false) } catch {}
        [System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($workbook) | Out-Null
    }
    if ($null -ne $excel) {
        try { $excel.Quit() } catch {}
        [System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel) | Out-Null
    }
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
