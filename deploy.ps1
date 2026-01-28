# -----------------------------
# Configuration
# -----------------------------
$DownloadUrl  = "https://raw.githubusercontent.com/LesSolutionsOneSky/Control/main/ScreenConnect.ClientSetup.msi"
$SoftwarePath = "C:\Temp\ScreenConnect.ClientSetup.msi"


# -----------------------------
# Functions
# -----------------------------

function Ensure-TempFolder {
    param(
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}


function Download-Installer {
    param(
        [string]$Url,
        [string]$Destination
    )

    Write-Host "Downloading from: $Url"
    Write-Host "Downloading to:   $Destination"

    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($Url, $Destination)
    $wc.Dispose()

    Write-Host "Download complete."
}


function Install-MSI {
    param(
        [string]$Path
    )

    Write-Host "Installing MSI..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$Path`" /qn /norestart" -Wait
    Write-Host "Installation complete."
}


# -----------------------------
# Script Execution
# -----------------------------

Ensure-TempFolder -Path (Split-Path $SoftwarePath -Parent)

Download-Installer -Url $DownloadUrl -Destination $SoftwarePath

Install-MSI -Path $SoftwarePath
