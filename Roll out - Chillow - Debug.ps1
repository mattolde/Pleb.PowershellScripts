﻿Set-Location (Split-Path $myInvocation.MyCommand.Path)

. .\"Roll out - Functions.ps1"

$pathToLibraryProjectFolder = "F:\Open Source\Chillow\"
$libraryProjectName = "Chillow"
$buildType = "Debug"

# Build Project

Build-Project `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-otherProperties: ";ILMerge=True"

# Copy build to locations *

# Aid

Update-ToLatestVersionOfProject `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-pathToProjectRoot: "F:\Aid\Core\" `
	-projectName: "Aid.Core" `
	-commonUpdateFilter: @("Chillow_ILM.*")

Update-ToLatestVersionOfProject `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-pathToProjectRoot: "F:\Aid\DC Retail Website\" `
	-projectName: "Aid.DigitalContent.RetailWebsite" `
	-otherDeleteFileLocations: @("F:\Aid\DC Retail Website\Source\Aid.DigitalContent.RetailWebsite.Web\bin\") `
	-commonUpdateFilter: @("Chillow_ILM.*")
	
# Aieg	
	
Update-ToLatestVersionOfProject `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-pathToProjectRoot: "F:\Aieg\Public Website\" `
	-projectName: "Aieg.PublicWebsite" `
	-otherDeleteFileLocations: @("F:\Aieg\Public Website\Source\Aieg.PublicWebsite.Web\bin\") `
	-commonUpdateFilter: @("Chillow_ILM.*")	
	
# Pfilms
	
Update-ToLatestVersionOfProject `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-pathToProjectRoot: "F:\Pfilms\Public Website\" `
	-projectName: "Pfilms.PublicWebsite" `
	-otherDeleteFileLocations: @("F:\Pfilms\Public Website\Source\Pfilms.PublicWebsite.Web\bin\") `
	-commonUpdateFilter: @("Chillow_ILM.*")		