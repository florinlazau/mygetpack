if(Test-Path .\nupkgs) { Remove-Item .\nupkgs -Force -Recurse }

dotnet build 

dotnet pack --output nupkgs