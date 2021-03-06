﻿function PushToRemote([string] $repositoryName, [string] $pathToRepository, [string] $remoteName)
{
	$currentLocation = Get-Location

    Write-Host "Pushing commits of " $repositoryName
    
    Set-Location $pathToRepository
    
    Invoke-Expression ("git push " + $remoteName)
    
    Set-Location $currentLocation    
}

#
# Make sure this path variable is correct for your install/machine
#

$env:path += ";C:\Program Files (x86)\Git\cmd"

#
# List each project you would like too push commits for
#
# Note: "origin" is the default name, but you might have called it something different. You can edit this using the Git-Extensions browser.
#

# Chillow

PushToRemote "Chillow" "F:\Open Source\Chillow\" "origin"

# Pleb

PushToRemote "Pleb Examples" "F:\Pleb\Examples\" "origin"
PushToRemote "Pleb Powershell Scripts" "F:\Pleb\Powershell Scripts\" "origin"
PushToRemote "Pleb Macros" "F:\Pleb\VisualStudio Macros\" "origin"

# Aid

PushToRemote "Aid Core" "F:\Aid\Core\" "origin"
PushToRemote "Aid Web Modules Core" "F:\Aid\Web Modules Core\" "origin"
PushToRemote "Aid DC Retail Website" "F:\Aid\DC Retail Website\" "origin"
PushToRemote "Aid Miscellaneous" "F:\Aid\Miscellaneous\" "origin"
PushToRemote "Aid Old Projects" "F:\Aid\Old Projects\" "origin"
PushToRemote "Aid Old RetailSites" "F:\Aid\Old RetailSites\" "origin"

# Aieg

PushToRemote "Aieg Public Website" "F:\Aieg\Public Website\" "origin"

# Pfilms

PushToRemote "Pfilms Public Website" "F:\Pfilms\Public Website\" "origin"

Write-Host "Press anykey to continue"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")