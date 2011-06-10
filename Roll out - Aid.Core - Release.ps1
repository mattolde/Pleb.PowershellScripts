Set-Location (Split-Path $myInvocation.MyCommand.Path)

. .\"Roll out - Functions.ps1"

$pathToLibraryProjectFolder = "F:\Aid\Aid.Core\"
$libraryProjectName = "Aid.Core"
$buildType = "Release"

# Build Project

BuildProject $pathToLibraryProjectFolder $libraryProjectName $buildType

# Copy build to locations *

UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.Old.RetailSite.BannerManagement\" "Aid.Old.RetailSite.BannerManagement"
UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.Publisher.PublicWebsite\" "Aid.Publisher.PublicWebsite"

DeleteBuildDirectory "F:\Aid\Aid.RetailWebsite\Source\Aid.RetailWebsite.Web\bin\"
UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.RetailWebsite\" "Aid.RetailWebsite"