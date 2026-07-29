$ErrorActionPreference = "Continue"

# Evita caracteres corruptos al ejecutarse desde consolas Windows configuradas
# con una página de códigos distinta de UTF-8.
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
$OutputEncoding = [Console]::OutputEncoding

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

        # No usar `git pull` sin destino: algunos repos pueden tener varias
        # ramas de integración configuradas y Git no sabe cuál avanzar.
        $upstream = git rev-parse --abbrev-ref '@{upstream}' 2>$null

        if (-not $upstream) {
            Write-Host "⚠️ $($repo.Name): [$branch] no tiene upstream; no se hizo pull"
            continue
        }

        git merge --ff-only --quiet $upstream

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
