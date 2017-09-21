if(Test-Path .\nupkgs) { Remove-Item .\nupkgs -Force -Recurse }

dotnet build 

 dotnet pack /p:PackageVersion=2.0.3.2   --output nupkgs