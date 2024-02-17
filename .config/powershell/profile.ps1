$ConfigRoot = "$HOME\.config"
$OmpThemeName = 'quick-term'

set-alias 'push' 'Push-Location'
set-alias 'pop' 'Pop-Location'

function Use-DotfilesRepo {
    git --git-dir="$HOME\.dotfiles" --work-tree "$HOME" @Args
}
set-alias "df" "Use-DotfilesRepo"

function Open-DotfilesWorkspace {
    code "$ConfigRoot\dotfiles.code-workspace"
}
Set-Alias "dfws" "Open-DotfilesWorkspace"

function Sync-DotfilesToRemote {
    param (
        [Parameter(Mandatory = $true)]
        [string] $commitMessage
    )
    Write-Host "Syncing dotfiles to prevent conficts." -ForegroundColor Blue
    Use-DotfilesRepo pull
    Push-Location $HOME
    Write-Host "Adding all tracked files under current location to staging." -ForegroundColor Blue
    Use-DotfilesRepo add . -u
    Write-Host "Commiting and pushing to remote." -ForegroundColor Blue
    Use-DotfilesRepo commit -m $commitMessage
    Use-DotfilesRepo push
    Write-Host "Done." -ForegroundColor Blue
    Pop-Location
}

function Start-Shell {
    $ompThemePath = "$ScoopApps\oh-my-posh\current\themes\$OmpThemeName.omp.json"
    oh-my-posh init pwsh --config $ompThemePath | Invoke-Expression
}
Start-Shell