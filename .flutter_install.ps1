try {
    $destRoot = "$env:USERPROFILE"
    $installDir = Join-Path $destRoot "flutter"

    if (Test-Path $installDir) {
        Write-Output "Flutter already exists at: $installDir"
    } else {
        $indexUrl = "https://storage.googleapis.com/flutter_infra_release/releases/releases_windows.json"
        Write-Output "Fetching releases index..."
        $r = Invoke-RestMethod -Uri $indexUrl -UseBasicParsing
        $release = ($r.releases | Where-Object { $_.channel -eq 'stable' } | Sort-Object -Property release_date -Descending)[0]
        if (-not $release) { throw "Could not determine stable release from index." }
        $archive = $release.archive
        $base = $r.base_url
        $downloadUrl = "$base/$archive"
        $out = Join-Path $env:TEMP "flutter_windows_stable.zip"
        if (Test-Path $out) { Remove-Item $out -Force -ErrorAction SilentlyContinue }

        Write-Output "Downloading $downloadUrl ..."
        Invoke-WebRequest -Uri $downloadUrl -OutFile $out

        Write-Output "Extracting to $destRoot ..."
        Expand-Archive -Path $out -DestinationPath $destRoot -Force
        Remove-Item $out -ErrorAction SilentlyContinue
        Write-Output "Flutter extracted to $installDir"
    }

    # Update user PATH
    $currentUserPath = [Environment]::GetEnvironmentVariable("Path","User")
    $flutterBin = Join-Path $installDir "bin"
    if ($currentUserPath -notlike "*$flutterBin*") {
        [Environment]::SetEnvironmentVariable("Path", "$flutterBin;$currentUserPath", "User")
        Write-Output "Updated user PATH with $flutterBin"
    } else {
        Write-Output "PATH already contains $flutterBin"
    }

    # Update current session PATH so flutter is immediately available here
    $env:Path = "$flutterBin;$env:Path"

    Write-Output "Running flutter doctor..."
    flutter doctor
} catch {
    Write-Error "Installation failed: $_"
    exit 1
}