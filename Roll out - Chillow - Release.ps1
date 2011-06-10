Set-Location (Split-Path $myInvocation.MyCommand.Path)

. .\"Roll out - Functions.ps1"

$pathToLibraryProjectFolder = "F:\Open Source\Chillow\"
$libraryProjectName = "Chillow"
$buildType = "Release"

# Build Project

BuildProject $pathToLibraryProjectFolder $libraryProjectName $buildType

# Copy build to locations *

UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.Core\" "Aid.Core"

UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.Old.RetailSite.BannerManagement\" "Aid.Old.RetailSite.BannerManagement"

DeleteBuildDirectory "F:\Aid\Aid.Publisher.PublicWebsite\Source\Aid.RetailWebsite.Web\bin\"
UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.Publisher.PublicWebsite\" "Aid.Publisher.PublicWebsite"

DeleteBuildDirectory "F:\Aid\Aid.RetailWebsite\Source\Aid.RetailWebsite.Web\bin\"
UpdateProjectToLatestVersionOfProject $pathToLibraryProjectFolder $libraryProjectName $buildType "F:\Aid\Aid.RetailWebsite\" "Aid.RetailWebsite"