$ErrorActionPreference = "Continue"

# vento-shell/scripts -> vento-shell -> carpeta que contiene todos los repos
$workspaceRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

$repos = Get-ChildItem -Path $workspaceRoot -Directory |
    Where-Object {
        Test-Path (Join-Path $_.FullName ".git")
    }

Write-Host ""
Write-Host "ACTUALIZANDO REPOSITORIOS VENTO"
Write-Host "Carpeta: $workspaceRoot"
Write-Host ""

foreach ($repo in $repos) {
    Push-Location $repo.FullName

    try {
        $branch = git branch --show-current 2>$null

        if (-not $branch) {
            Write-Host "⚠️ $($repo.Name): rama no identificada"
            continue
        }

        git fetch --prune --quiet

        $localChanges = git status --porcelain

        if ($localChanges) {
            Write-Host "⚠️ $($repo.Name): tiene cambios locales; no se hizo pull"
            continue
        }

        git pull --ff-only --quiet

        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ $($repo.Name): actualizado [$branch]"
        }
        else {
            Write-Host "❌ $($repo.Name): no pudo actualizarse"
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host ""
Write-Host "PROCESO TERMINADO"