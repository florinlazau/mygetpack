if(Test-Path .\nupkgs) { Remove-Item .\nupkgs -Force -Recurse }

$myBuildNumber = (Get-Date).Year + ((Get-Date).Month) + (Get-Date).Day +(Get-Date).Hour+(Get-Date).Minute   +(Get-Date).Second  

$filePath =  Resolve-Path  "mygetpack.csproj"
$xml=New-Object XML
$xml.Load($filePath)

$splitNumber = $xml.Project.PropertyGroup.Version.Split(".")
$majorNumber = $splitNumber[0]
$minorNumber = $splitNumber[1]
$patchNumber = $splitNumber[2]

dotnet build 

dotnet pack /p:PackageVersion=$majorNumber.$minorNumber.$patchNumber.$myBuildNumber   --output nupkgs