param()

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$templatePath = Join-Path $repoRoot 'supabase\templates\nexo_v1_validation_sandbox_cleanup.sql'
$migrationsPath = Join-Path $repoRoot 'supabase\migrations'
$timestamp = Get-Date -Format 'yyyyMMddHHmmss'
$migrationName = "${timestamp}_nexo_v1_validation_sandbox_cleanup.sql"
$targetPath = Join-Path $migrationsPath $migrationName

if (-not (Test-Path $templatePath)) {
  throw "No existe el template de cleanup: $templatePath"
}

Copy-Item $templatePath $targetPath -Force
Write-Host "Cleanup migration creada: $targetPath"

& (Join-Path $repoRoot 'scripts\sync-migrations.ps1')
supabase db push --workdir $repoRoot --yes
supabase migration list --workdir $repoRoot
