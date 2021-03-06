﻿function Build-Project([string]$pathToLibraryProjectFolder, [string] $libraryProjectName, [string] $buildType, [string] $otherProperties)
{
	$pathToBuilds = $pathToLibraryProjectFolder + "Builds\"
	$pathToBuildOutput = $pathToLibraryProjectFolder + "Builds\" + $buildType + "\"
	$pathToBuildBatchFile = $pathToLibraryProjectFolder + "Build Source - " + $buildType +".bat"
	$pathToSolutionFile = $pathToLibraryProjectFolder + "Source\" + $libraryProjectName + ".sln"
	
	Create-DirectoryIfNotExist @($pathToBuilds, $pathToBuildOutput)
	
	Write-Host ""
    Write-Host "Building '" $buildType "' version of '" $libraryProjectName "'."
	
	Write-Host "Cleaning build output folder."
   
    Remove-Item -Path ($pathToBuildOutput + "*")	

	$result = & $env:windir\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe /property:Configuration=$buildType$otherProperties $pathToSolutionFile
    
	Write-Host "Checking build for errors."
       
    [System.Array]::Reverse($result)
    
    foreach($line in $result)
    {
        Write-Host ("    | " + $line)
    
        if ($line.Contains("Error(s)"))
        {
            if (!$line.Contains("0 Error(s)"))
            {
                Write-Host "Build failed."
                Write-Host "Press any key to continue ..."
                $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                Return
            }
            
            break;
        }
    }
    
    Write-Host "Build ok."    
}

function Update-ToLatestVersionOfProject([string]$pathToLibraryProjectFolder, [string]$libraryProjectName, [string]$buildType, [string]$pathToProjectRoot, [string] $projectName, [string[]] $otherDeleteFileLocations, [string[]] $commonUpdateFilter)
{
	#From
	
	$pathToBuildOutput = $pathToLibraryProjectFolder + "Builds\" + $buildType + "\"

	#To
	
	$pathToLibFolder = $pathToProjectRoot + "Lib\"
	$pathToLibCommonFolder = $pathToProjectRoot + "Lib\Common\"
	$pathToLibBuildFolder = $pathToProjectRoot + "Lib\" + $libraryProjectName + "\"
	$pathToDestinationGlobalFolder = $pathToProjectRoot + "Builds\"
	
	Create-DirectoryIfNotExist @($pathToDestinationGlobalFolder, $pathToLibFolder, $pathToLibBuildFolder, $pathToLibCommonFolder)
	
	Write-Host "Clearing destination global build folder."
	   
    Remove-Item -Path ($pathToDestinationGlobalFolder + "*") -Recurse		
	
	Write-Host "Clearing other delete locations."
	
	if ($otherDeleteFileLocations.Count -gt 0)
	{
		Create-DirectoryIfNotExist $otherDeleteFileLocations
	
		foreach($otherDeleteFileLocation in $otherDeleteFileLocations)
		{
			Remove-Item -Path ($otherDeleteFileLocation + "*")	
		}
	}	
	
	Write-Host "Removing old library files."
	  
    Remove-Item -Path ($pathToLibBuildFolder + "*")
	
    Write-Host "Copying the latest '" $buildType "' build of '" $libraryProjectName "' to project '" $projectName "'."
    
    Copy-Item `
        -Path ($pathToBuildOutput + "*") `
        -Destination $pathToLibBuildFolder `
        -Include ("*" + $libraryProjectName + "*.dll"), ("*" + $libraryProjectName + "*.exe"), ("*" + $libraryProjectName + "*.pdb"), ("*" + $libraryProjectName + "*.xml"), ("*" + $libraryProjectName + "*.config") `
        -Exclude "*Tests.*"    
		
	if ($commonUpdateFilter.Count -gt 0)
	{
		Copy-Item `
			-Path ($pathToBuildOutput + "*") `
			-Destination $pathToLibCommonFolder `
			-Include $commonUpdateFilter
	}
    
    Write-Host "Library has been updated."
}

function Create-DirectoryIfNotExist([string[]]$directoryPaths)
{
	if ($directoryPaths.Count -gt 0)
	{
		foreach($directoryPath in $directoryPaths)
		{	
			if (![IO.Directory]::Exists($directoryPath))
			{
				New-Item $directoryPath -type directory
			}		
		}
	}
}

function Get-ScriptDirectory
{
	$Invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $Invocation.MyCommand.Path
}