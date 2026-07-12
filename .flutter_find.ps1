$paths = @(
    "$env:USERPROFILE\flutter",
    "C:\src\flutter",
    "C:\flutter",
    "$env:LOCALAPPDATA\Programs\flutter",
    "$env:PROGRAMFILES\flutter",
    "$env:USERPROFILE\development\flutter"
)
$found = @()
foreach ($p in $paths) {
    $bin = Join-Path $p 'bin\flutter.bat'
    if (Test-Path $bin) {
        $found += (Resolve-Path $p).Path
    }
}
if ($found.Count -gt 0) {
    $found -join "`n"
} else {
    Write-Output "NOT_FOUND"
}
