﻿function PullFromRemote([string] $repositoryName, [string] $pathToRepository, [string] $remoteName)
{
	$currentLocation = Get-Location

    Write-Host "Getting latest version of " $repositoryName
    
    Set-Location $pathToRepository
    
    Invoke-Expression ("git pull " + $remoteName)
    
    Set-Location $currentLocation    
}

#
# Make sure this path variable is correct for your install/machine
#

$env:path += ";C:\Program Files (x86)\Git\cmd"

#
# List each project you would like too pull updates for. 
#
# Note: "origin" is the default name, but you might have called it something different. You can edit this using the Git-Extensions browser.
#

# Chillow

PullFromRemote "Chillow" "F:\Open Source\Chillow\" "origin"

# Pleb

PullFromRemote "Pleb Examples" "F:\Pleb\Examples\" "origin"
PullFromRemote "Pleb Powershell Scripts" "F:\Pleb\Powershell Scripts\" "origin"
PullFromRemote "Pleb Macros" "F:\Pleb\VisualStudio Macros\" "origin"

# Aid

PullFromRemote "Aid Core" "F:\Aid\Core\" "origin"
PullFromRemote "Aid Web Modules Core" "F:\Aid\Web Modules Core\" "origin"
PullFromRemote "Aid DC Retail Website" "F:\Aid\DC Retail Website\" "origin"
PullFromRemote "Aid Miscellaneous" "F:\Aid\Miscellaneous\" "origin"
PullFromRemote "Aid Old Projects" "F:\Aid\Old Projects\" "origin"
PullFromRemote "Aid Old RetailSites" "F:\Aid\Old RetailSites\" "origin"

# Aieg

PullFromRemote "Aieg Public Website" "F:\Aieg\Public Website\" "origin"

# Pfilms

PullFromRemote "Pfilms Public Website" "F:\Pfilms\Public Website\" "origin"

Write-Host "Press anykey to continue"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")