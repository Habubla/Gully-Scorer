$path = 'C:\Users\nishc\AppData\Local\Temp\stable\windows\flutter_windows_3.44.4-stable.zip'
if (Test-Path $path) {
    try {
        Remove-Item $path -Force -ErrorAction Stop
        Write-Output 'REMOVED'
    } catch {
        Write-Error "REMOVE_FAILED: $_"
    }
} else {
    Write-Output 'NO_FILE'
}
