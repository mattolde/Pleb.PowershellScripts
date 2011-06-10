function PushToRemote([string] $repositoryName, [string] $pathToRepository, [string] $remoteName)
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

PushToRemote "Aid.Core" "F:\Aid\Aid.Core\" "origin"
PushToRemote "Aid.Core.Web.CoreModules" "F:\Aid\Aid.Core.Web.CoreModules\" "origin"
PushToRemote "Aid.Miscellaneous" "F:\Aid\Aid.Miscellaneous\" "origin"
PushToRemote "Aid.Old.Projects" "F:\Aid\Aid.Old.Projects\" "origin"
PushToRemote "Aid.Old.RetailSite.BannerManagement" "F:\Aid\Aid.Old.RetailSite.BannerManagement\" "origin"
PushToRemote "Aid.Old.RetailSites" "F:\Aid\Aid.Old.RetailSites\" "origin"
PushToRemote "Aid.Publisher.PublicWebsite" "F:\Aid\Aid.Publisher.PublicWebsite\" "origin"
PushToRemote "Aid.RetailWebsite" "F:\Aid\Aid.RetailWebsite\" "origin"
PushToRemote "Chillow" "F:\Open Source\Chillow\" "origin"

Write-Host "Press anykey to continue"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")