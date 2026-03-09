param(
  [string]$SourceRepo = "vento-shell",
  [string[]]$TargetRepos = @("vento-pass","vento-anima","vento-vital","vento-nexo","vento-viso")
)

$workspace = "c:\Users\User\devVentoGroup"
$sourceDir = Join-Path $workspace "$SourceRepo\supabase\migrations"
if (-not (Test-Path $sourceDir)) {
  throw "No existe la carpeta de origen: $sourceDir"
}

$sourceFiles = Get-ChildItem -File $sourceDir | Sort-Object Name
if ($sourceFiles.Count -eq 0) {
  throw "No hay migraciones en el origen: $sourceDir"
}

foreach ($repo in $TargetRepos) {
  $targetDir = Join-Path $workspace "$repo\supabase\migrations"
  New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

  Get-ChildItem -File $targetDir | Remove-Item -Force
  foreach ($file in $sourceFiles) {
    Copy-Item -Path $file.FullName -Destination (Join-Path $targetDir $file.Name) -Force
  }

  Write-Output "synced $repo ($($sourceFiles.Count) files)"
}
