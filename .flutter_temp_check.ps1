$out = 'C:\Users\nishc\AppData\Local\Temp\stable\windows\flutter_windows_3.44.4-stable.zip'
$outDir = Split-Path $out -Parent
Write-Output "OUTDIR=$outDir"
if (-not (Test-Path $outDir)) {
    New-Item -Path $outDir -ItemType Directory -Force | Out-Null
}
Write-Output "EXISTS=$(Test-Path $outDir)"
