try {
    $installDir = Join-Path $env:USERPROFILE "flutter"
    $flutterBin = Join-Path $installDir "bin"
    $downloadFile = Join-Path $env:TEMP ("flutter_windows_stable_{0}.zip" -f [guid]::NewGuid().ToString())
    Write-Output "Download file: $downloadFile"

    if (-not (Test-Path $installDir)) {
        $indexUrl = "https://storage.googleapis.com/flutter_infra_release/releases/releases_windows.json"
        Write-Output "Fetching Flutter release index..."
        $r = Invoke-RestMethod -Uri $indexUrl -UseBasicParsing

        $release = ($r.releases | Where-Object { $_.channel -eq "stable" } | Sort-Object -Property release_date -Descending)[0]
        if (-not $release) { throw "Could not determine stable release from index." }

        $downloadUrl = "$($r.base_url)/$($release.archive)"

        Write-Output "Downloading Flutter from $downloadUrl ..."
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        try {
            Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadFile -UseBasicParsing -TimeoutSec 300
        } catch {
            Write-Output "Primary download failed: $_"
            if (Get-Command curl.exe -ErrorAction SilentlyContinue) {
                Write-Output "Falling back to curl.exe"
                curl.exe -L -o $downloadFile $downloadUrl
            } else {
                throw "Unable to download Flutter SDK with Invoke-WebRequest or curl." }
        }

        Write-Output "Extracting Flutter SDK to $installDir ..."
        Expand-Archive -Path $downloadFile -DestinationPath $env:USERPROFILE -Force
        Remove-Item $downloadFile -ErrorAction SilentlyContinue
    } else {
        Write-Output "Flutter already exists at $installDir"
    }

    $currentUserPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($currentUserPath -notlike "*$flutterBin*") {
        [Environment]::SetEnvironmentVariable("Path", "$flutterBin;$currentUserPath", "User")
        Write-Output "Added $flutterBin to user PATH"
    } else {
        Write-Output "User PATH already contains $flutterBin"
    }

    $env:Path = "$flutterBin;$env:Path"

    Write-Output "Verifying Flutter installation..."
    flutter --version
    flutter doctor
} catch {
    Write-Error "Installation failed: $_"
    exit 1
}
