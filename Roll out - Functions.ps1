function BuildProject([string]$pathToLibraryProjectFolder, [string] $libraryProjectName, [string] $buildType)
{
	$pathToBuilds = $pathToLibraryProjectFolder + "Builds\"
	$pathToBuildOutput = $pathToLibraryProjectFolder + "Builds\" + $buildType + "\"
	$pathToBuildBatchFile = $pathToLibraryProjectFolder + "Build Source - " + $buildType +".bat"
	$pathToSolutionFile = $pathToLibraryProjectFolder + "Source\" + $libraryProjectName + ".sln"
	
	Write-Host ""
    Write-Host "Building '" $buildType "' version of '" $libraryProjectName "'."
	
	Write-Host "Cleaning build output folder."
	
	if (![IO.Directory]::Exists($pathToBuilds))
	{
		New-Item $pathToBuilds -type directory
	}	
	
	if (![IO.Directory]::Exists($pathToBuildOutput))
	{
		New-Item $pathToBuildOutput -type directory
	}	
    
    Remove-Item -Path ($pathToBuildOutput + "*")	

	$result = & $env:windir\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe /property:Configuration=$buildType $pathToSolutionFile
    
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

function UpdateProjectToLatestVersionOfProject([string]$pathToLibraryProjectFolder, [string]$libraryProjectName, [string]$buildType, [string]$pathToProjectRoot, [string] $projectName)
{
	#From
	
	$pathToBuildOutput = $pathToLibraryProjectFolder + "Builds\" + $buildType + "\"

	#To
	
	$pathToLibFolder = $pathToProjectRoot + "Lib\"
	$pathToLibBuildFolder = $pathToProjectRoot + "Lib\" + $libraryProjectName + "\"
	$pathToDestinationGlobalFolder = $pathToProjectRoot + "Builds\"

	Write-Host "Clearing global build folder"
	
	if (![IO.Directory]::Exists($pathToDestinationGlobalFolder))
	{
		New-Item $pathToDestinationGlobalFolder -type directory
	}	
    
    Remove-Item -Path ($pathToDestinationGlobalFolder + "*") -Recurse		
	
    Write-Host "Copying the latest '" $buildType "' build of '" $libraryProjectName "' to project '" $projectName "'."
    
	Write-Host "Removing old build files."
	
	if (![IO.Directory]::Exists($pathToLibFolder))
	{
		New-Item ($pathToLibFolder) -type directory
	}
	
	if (![IO.Directory]::Exists($pathToLibBuildFolder))
	{
		New-Item ($pathToLibBuildFolder) -type directory
	}	
    
    Remove-Item -Path ($pathToLibBuildFolder + "*")
   
    Copy-Item `
        -Path ($pathToBuildOutput + "*") `
        -Destination $pathToLibBuildFolder `
        -Include ("*" + $libraryProjectName + "*.dll"), ("*" + $libraryProjectName + "*.exe"), ("*" + $libraryProjectName + "*.pdb"), ("*" + $libraryProjectName + "*.xml"), ("*" + $libraryProjectName + "*.config") `
        -Exclude "*Tests.*"    
    
    Write-Host "Library has been updated."
}

function DeleteBuildDirectory([string]$pathToDirectory)
{
	if (![IO.Directory]::Exists($pathToDirectory))
	{
		New-Item $pathToDirectory -type directory
	}	
    
    Remove-Item -Path ($pathToDirectory + "*")	
}