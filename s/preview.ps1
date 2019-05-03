#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
function exitIfFailed { if ($LASTEXITCODE -ne 0) { exit } }

$exe = "./blog_app.exe"
go build -o blog_app.exe
exitIfFailed
Start-Process -Wait -NoNewWindow -FilePath $exe -ArgumentList "-preview-on-demand -no-download"
Remove-Item -Path $exe
