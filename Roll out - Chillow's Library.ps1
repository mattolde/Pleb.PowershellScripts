Write-Host ""

function Get-ScriptDirectory
{
	$Invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $Invocation.MyCommand.Path
}

Add-Type -Path (Join-Path (Get-ScriptDirectory) "Builds\Pleb.PowershellScripts.dll")

function UpdateToChillowLib([string]$pathToChillowLib, [string]$pathWhereToCopyTo)
{
	[Pleb.PowershellScripts.DirectoryUtilities]::RemoveDirectoriesWhereSame($pathToChillowLib, $pathWhereToCopyTo)
	[Pleb.PowershellScripts.DirectoryUtilities]::CopyDirectory($pathToChillowLib, $pathWhereToCopyTo)
}

# AID

UpdateToChillowLib "F:\Open Source\Chillow\Lib" "F:\Aid\Aid.Core\Lib"
UpdateToChillowLib "F:\Open Source\Chillow\Lib" "F:\Aid\Aid.Old.RetailSite.BannerManagement\Lib"
UpdateToChillowLib "F:\Open Source\Chillow\Lib" "F:\Aid\Aid.Publisher.PublicWebsite\Lib"
UpdateToChillowLib "F:\Open Source\Chillow\Lib" "F:\Aid\Aid.RetailWebsite\Lib"

# Pleb

