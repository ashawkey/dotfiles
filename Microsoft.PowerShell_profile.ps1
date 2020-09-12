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


### jupyter
function jpt
{
    ssh -N -f -L localhost:8888:localhost:8888 tang@222.29.2.45
}
