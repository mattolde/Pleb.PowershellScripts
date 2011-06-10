function PullFromRemote([string] $repositoryName, [string] $pathToRepository, [string] $remoteName)
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

PullFromRemote "Aid.Core" "F:\Aid\Aid.Core\" "origin"
PullFromRemote "Aid.Core.Web.CoreModules" "F:\Aid\Aid.Core.Web.CoreModules\" "origin"
PullFromRemote "Aid.Miscellaneous" "F:\Aid\Aid.Miscellaneous\" "origin"
PullFromRemote "Aid.Old.Projects" "F:\Aid\Aid.Old.Projects\" "origin"
PullFromRemote "Aid.Old.RetailSite.BannerManagement" "F:\Aid\Aid.Old.RetailSite.BannerManagement\" "origin"
PullFromRemote "Aid.Old.RetailSites" "F:\Aid\Aid.Old.RetailSites\" "origin"
PullFromRemote "Aid.Publisher.PublicWebsite" "F:\Aid\Aid.Publisher.PublicWebsite\" "origin"
PullFromRemote "Aid.RetailWebsite" "F:\Aid\Aid.RetailWebsite\" "origin"
PullFromRemote "Chillow" "F:\Open Source\Chillow\" "origin"

Write-Host "Press anykey to continue"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")