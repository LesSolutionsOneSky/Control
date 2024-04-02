$DownloadPath = "https://screenconnect.aidepc.ca:4443/Bin/One-Sky.ClientSetup.exe?e=Access&y=Guest&c=a%20verifier&c=&c=&c=&c=&c=&c=&c="
$SoftwarePath = "C:\Temp\Control_Agent.exe"

    Write-Host "Downloading from: $($DownloadPath)"
    Write-Host "Downloading to:   $($SoftwarePath)"
        $WebClient = New-Object System.Net.WebClient
        $WebClient.DownloadFile($DownloadPath, $SoftwarePath)
    Write-Host "Download Complete"
Start-Process -FilePath $SoftwarePath -ArgumentList "/quiet /norestart" -Wait -Verb RunAs -PassThru
