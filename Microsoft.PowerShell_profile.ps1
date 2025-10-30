# powershell $profile

set-alias l ls
set-alias npp notepad
set-alias grep select-string

function lN
{
    ls -Name
}
function la
{
    ls -hidden
}

function ..
{
    cd ..
}

function W
{
    set-location E:\aa
}

# recursively find files, mimicking find.
function find([string] $glob)
{
    ls -recurse -include $glob
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# path
#$env:Path += ";C:\Program Files\Racket"

# Function to turn the proxy ON for the current session
function proxy_on {
    param(
        [string]$ProxyAddress = "127.0.0.1:7890"
    )
    
    Write-Host "Setting proxy environment variables for current terminal session..." -ForegroundColor Yellow
    
    # Set environment variables (HTTP_PROXY, HTTPS_PROXY, NO_PROXY)
    $env:HTTP_PROXY = "http://$ProxyAddress"
    $env:HTTPS_PROXY = "http://$ProxyAddress"
    $env:NO_PROXY = "localhost,127.0.0.1"

    Write-Host "Proxy ON. Check with: $env:HTTP_PROXY" -ForegroundColor Green
    Write-Host "NOTE: This only affects the current session and programs that respect these variables." -ForegroundColor Cyan
}

# Function to turn the proxy OFF for the current session
function proxy_off {
    Write-Host "Clearing proxy environment variables for current terminal session..." -ForegroundColor Yellow
    
    # Clear environment variables by removing them
    Remove-Item Env:\HTTP_PROXY -ErrorAction SilentlyContinue
    Remove-Item Env:\HTTPS_PROXY -ErrorAction SilentlyContinue
    Remove-Item Env:\NO_PROXY -ErrorAction SilentlyContinue

    Write-Host "Proxy OFF. Environment variables cleared." -ForegroundColor Green
}
