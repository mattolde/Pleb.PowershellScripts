Set-Location (Split-Path $myInvocation.MyCommand.Path)

. .\"Roll out - Functions.ps1"

Add-Type -Path  "Builds\Pleb.PowershellScripts.dll"

function Sync-Folder([string]$pathToSource, [string]$pathToDestination)
{
	Create-DirectoryIfNotExist @($pathToSource, $pathToDestination)
	[Pleb.PowershellScripts.DirectoryUtilities]::DeleteFilesInDirectory($pathToDestination)
	[Pleb.PowershellScripts.DirectoryUtilities]::RemoveDirectoriesWithSameName($pathToSource, $pathToDestination)
	[Pleb.PowershellScripts.DirectoryUtilities]::CopyDirectory($pathToSource, $pathToDestination)
}

# AID

Sync-Folder "F:\Open Source\Chillow\Lib" "F:\Aid\Core\Lib"
Sync-Folder "F:\Open Source\Chillow\Tools" "F:\Aid\Core\Tools"

Sync-Folder "F:\Open Source\Chillow\Lib" "F:\Aid\Publisher Public Website\Lib"
Sync-Folder "F:\Open Source\Chillow\Tools" "F:\Aid\Publisher Public Website\Tools"

Sync-Folder "F:\Open Source\Chillow\Lib" "F:\Aid\DC Retail Website\Lib"
Sync-Folder "F:\Open Source\Chillow\Tools" "F:\Aid\DC Retail Website\Tools"

# Pleb

