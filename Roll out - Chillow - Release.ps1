Set-Location (Split-Path $myInvocation.MyCommand.Path)

. .\"Roll out - Functions.ps1"

$pathToLibraryProjectFolder = "F:\Open Source\Chillow\"
$libraryProjectName = "Chillow"
$buildType = "Release"

# Build Project

Build-Project `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-otherProperties: ";ILMerge=True"

# Copy build to locations *

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
	-pathToProjectRoot: "F:\Aid\Publisher Public Website\" `
	-projectName: "Aid.Publisher.PublicWebsite" `
	-otherDeleteFileLocations: @("F:\Aid\Publisher Public Website\Source\Aid.Publisher.PublicWebsite.Web\bin\") `
	-commonUpdateFilter: @("Chillow_ILM.*")	
	
Update-ToLatestVersionOfProject `
	-pathToLibraryProjectFolder: $pathToLibraryProjectFolder `
	-libraryProjectName: $libraryProjectName `
	-buildType: $buildType `
	-pathToProjectRoot: "F:\Aid\DC Retail Website\" `
	-projectName: "Aid.DigitalContent.RetailWebsite" `
	-otherDeleteFileLocations: @("F:\Aid\DC Retail Website\Source\Aid.DigitalContent.RetailWebsite.Web\bin\") `
	-commonUpdateFilter: @("Chillow_ILM.*")