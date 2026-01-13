$DownloadPath = "https://raw.githubusercontent.com/LesSolutionsOneSky/Control/refs/heads/main/ScreenConnect.ClientSetup.msi"
$SoftwarePath = "C:\Temp\ScreenConnect.ClientSetup.msi"

    Write-Host "Downloading from: $($DownloadPath)"
    Write-Host "Downloading to:   $($SoftwarePath)"
        $WebClient = New-Object System.Net.WebClient
        $WebClient.DownloadFile($DownloadPath, $SoftwarePath)
    Write-Host "Download Complete"
Start-Process -FilePath $SoftwarePath -ArgumentList "/quiet /norestart" -Wait -Verb RunAs -PassThru
