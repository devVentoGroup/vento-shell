param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath,
  [Parameter(Mandatory = $true)]
  [string]$AppName,
  [string]$AppCode,
  [ValidateSet("NEXO", "FOGO", "PULSO", "VISO", "ORIGO", "ANIMA", "AURA")]
  [string]$Palette,
  [string]$Domain,
  [string]$Description,
  [string]$Tagline,
  [switch]$SetActiveApp,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

function Convert-HexToRgb {
  param([Parameter(Mandatory = $true)][string]$Hex)
  $clean = $Hex.Trim().TrimStart("#")
  if ($clean.Length -ne 6) {
    throw "Invalid hex color: $Hex"
  }
  $r = [Convert]::ToInt32($clean.Substring(0, 2), 16)
  $g = [Convert]::ToInt32($clean.Substring(2, 2), 16)
  $b = [Convert]::ToInt32($clean.Substring(4, 2), 16)
  return @($r, $g, $b)
}

function To-Rgba {
  param(
    [Parameter(Mandatory = $true)][string]$Hex,
    [Parameter(Mandatory = $true)][double]$Alpha
  )
  $rgb = Convert-HexToRgb $Hex
  return "rgba($($rgb[0]), $($rgb[1]), $($rgb[2]), $Alpha)"
}

function Darken-Hex {
  param(
    [Parameter(Mandatory = $true)][string]$Hex,
    [Parameter(Mandatory = $true)][double]$Factor
  )
  $rgb = Convert-HexToRgb $Hex
  $r = [math]::Max([math]::Min([math]::Round($rgb[0] * $Factor), 255), 0)
  $g = [math]::Max([math]::Min([math]::Round($rgb[1] * $Factor), 255), 0)
  $b = [math]::Max([math]::Min([math]::Round($rgb[2] * $Factor), 255), 0)
  return "#{0:X2}{1:X2}{2:X2}" -f $r, $g, $b
}

function Set-CssVar {
  param(
    [Parameter(Mandatory = $true)][string]$Content,
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][string]$Value
  )
  $pattern = "(--$([regex]::Escape($Name)):\s*)([^;]+);"
  if ($Content -notmatch $pattern) {
    throw "Missing CSS var --$Name"
  }
  return ($Content -replace $pattern, "`${1}$Value;")
}

$palettes = @{
  PULSO = @{ Base = "#F5FBFF"; Base2 = "#ECF7FF"; Text = "#0F172A"; Accent = "#00D4FF"; Accent2 = "#0EA5E9"; Neutral = "#8AA4B2"; Neutral2 = "#E2EEF5" }
  VISO  = @{ Base = "#F6F2FF"; Base2 = "#EFE8FF"; Text = "#1B1033"; Accent = "#A855F7"; Accent2 = "#4C1D95"; Neutral = "#9B8FB6"; Neutral2 = "#E6DFF5" }
  FOGO  = @{ Base = "#FFF5EF"; Base2 = "#FFEDE3"; Text = "#2B150A"; Accent = "#FF6B35"; Accent2 = "#9A3412"; Neutral = "#B89A8F"; Neutral2 = "#F3E2DB" }
  NEXO  = @{ Base = "#FFF7E6"; Base2 = "#FFF1D1"; Text = "#2A1A00"; Accent = "#F59E0B"; Accent2 = "#92400E"; Neutral = "#B8A07A"; Neutral2 = "#F0E3C6" }
  ORIGO = @{ Base = "#ECFFF7"; Base2 = "#E0FFF1"; Text = "#0B2A1F"; Accent = "#10B981"; Accent2 = "#065F46"; Neutral = "#8FB8A9"; Neutral2 = "#D7EFE6" }
  ANIMA = @{ Base = "#F7F5F8"; Base2 = "#F2EEF2"; Text = "#1B1A1F"; Accent = "#E2006A"; Accent2 = "#B76E79"; Neutral = "#9E9AA6"; Neutral2 = "#E6E1EA" }
  AURA  = @{ Base = "#FFF7F2"; Base2 = "#FFEFE6"; Text = "#2B1A14"; Accent = "#FF7A59"; Accent2 = "#C2410C"; Neutral = "#BFAAA2"; Neutral2 = "#F2E2DC" }
}

if (-not $AppCode) {
  $AppCode = ($AppName -replace "\s+", "").ToLowerInvariant()
}

if (-not $Palette) {
  $Palette = $AppName.ToUpperInvariant()
}

if (-not $palettes.ContainsKey($Palette)) {
  throw "Palette '$Palette' not found. Use one of: $($palettes.Keys -join ', ')"
}

if (-not (Test-Path $TargetPath)) {
  throw "TargetPath not found: $TargetPath"
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$templateRoot = Join-Path $scriptRoot "..\templates\app-shell-standard"
$templateSrc = Join-Path $templateRoot "src"

if (-not (Test-Path $templateSrc)) {
  throw "Template not found at $templateRoot"
}

$targetSrc = Join-Path $TargetPath "src"
$targetApp = Join-Path $targetSrc "app"
$targetStandard = Join-Path $targetSrc "components\vento\standard"

if (-not (Test-Path $targetSrc)) {
  New-Item -ItemType Directory -Force -Path $targetSrc | Out-Null
}

New-Item -ItemType Directory -Force -Path $targetApp | Out-Null
New-Item -ItemType Directory -Force -Path $targetStandard | Out-Null

$managedFiles = @(
  (Join-Path $targetApp "globals.css"),
  (Join-Path $targetApp "layout.tsx"),
  (Join-Path $targetStandard "vento-shell.tsx"),
  (Join-Path $targetStandard "vento-chrome.tsx"),
  (Join-Path $targetStandard "ui.tsx"),
  (Join-Path $targetStandard "table.tsx"),
  (Join-Path $targetStandard "app-switcher.tsx"),
  (Join-Path $targetStandard "profile-menu.tsx")
)

if (-not $Force) {
  $existing = $managedFiles | Where-Object { Test-Path $_ }
  if ($existing.Count -gt 0) {
    throw "Target already has app shell files. Use -Force to overwrite."
  }
}

Copy-Item -Recurse -Force (Join-Path $templateSrc "app\*") $targetApp
Copy-Item -Recurse -Force (Join-Path $templateSrc "components\vento\standard\*") $targetStandard

$palette = $palettes[$Palette]
$brand700 = Darken-Hex $palette.Accent2 0.8
$surface2 = To-Rgba $palette.Base2 0.9
$border = To-Rgba $palette.Neutral2 0.9
$brandSoft = To-Rgba $palette.Accent 0.16
$focusRing = To-Rgba $palette.Accent 0.25

$globalsPath = Join-Path $targetApp "globals.css"
$globals = Get-Content -Raw $globalsPath
$globals = Set-CssVar $globals "ui-bg" $palette.Base
$globals = Set-CssVar $globals "ui-bg-2" $palette.Base2
$globals = Set-CssVar $globals "ui-text" $palette.Text
$globals = Set-CssVar $globals "ui-muted" $palette.Neutral
$globals = Set-CssVar $globals "ui-border" $border
$globals = Set-CssVar $globals "ui-brand" $palette.Accent
$globals = Set-CssVar $globals "ui-brand-600" $palette.Accent2
$globals = Set-CssVar $globals "ui-brand-700" $brand700
$globals = Set-CssVar $globals "ui-brand-soft" $brandSoft
$globals = Set-CssVar $globals "ui-surface-2" $surface2
$globals = $globals -replace "box-shadow:\s*0 0 0 3px rgba\([^)]+\);", "box-shadow: 0 0 0 3px $focusRing;"
Set-Content -Path $globalsPath -Value $globals -Encoding UTF8

$layoutPath = Join-Path $targetApp "layout.tsx"
$layout = Get-Content -Raw $layoutPath
$dot = [char]0x00B7
$upperName = $AppName.ToUpperInvariant()
$title = "Vento OS $dot $upperName"
$layout = $layout -replace "title:\s*\"[^\"]*\"", "title: \"$title\""
if ($Description) {
  $layout = $layout -replace "description:\s*\"[^\"]*\"", "description: \"$Description\""
}
if ($Domain) {
  $domainUrl = $Domain
  if ($domainUrl -notmatch "^https?://") {
    $domainUrl = "https://$domainUrl"
  }
  $layout = $layout -replace "metadataBase:\s*new URL\(\"[^\"]*\"\)", "metadataBase: new URL(\"$domainUrl\")"
}
Set-Content -Path $layoutPath -Value $layout -Encoding UTF8

$chromePath = Join-Path $targetStandard "vento-chrome.tsx"
$chrome = Get-Content -Raw $chromePath
$chrome = $chrome -replace "NEXO", $upperName
$chrome = $chrome -replace "nexo\.", "$AppCode."
if ($Tagline) {
  $chrome = $chrome -replace "Logística e inventario operativo", $Tagline
}
Set-Content -Path $chromePath -Value $chrome -Encoding UTF8

$profilePath = Join-Path $targetStandard "profile-menu.tsx"
$profile = Get-Content -Raw $profilePath
$profile = $profile -replace "Sesion activa en NEXO\.", "Sesion activa en $upperName."
Set-Content -Path $profilePath -Value $profile -Encoding UTF8

if ($SetActiveApp) {
  $switcherPath = Join-Path $targetStandard "app-switcher.tsx"
  if (Test-Path $switcherPath) {
    $switcher = Get-Content -Raw $switcherPath
    $pattern = "(?s)(id:\s*\"$AppCode\".*?status:\s*\")(\w+)(\")"
    if ($switcher -match $pattern) {
      $switcher = [regex]::Replace($switcher, $pattern, "`${1}active`${3}")
    }
    Set-Content -Path $switcherPath -Value $switcher -Encoding UTF8
  }
}

Write-Host "App shell copied to $TargetPath"
Write-Host "Palette: $Palette | App: $upperName | AppCode: $AppCode"
