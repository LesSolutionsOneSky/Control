$DownloadPath = "https://github.com/LesSolutionsOneSky/Control/blob/main/Control_Agent.exe"
$SoftwarePath = "C:\Temp\Control_Agent.exe"

    Write-Host "Downloading from: $($DownloadPath)"
    Write-Host "Downloading to:   $($SoftwarePath)"
        $WebClient = New-Object System.Net.WebClient
        $WebClient.DownloadFile($DownloadPath, $SoftwarePath)
    Write-Host "Download Complete"

Start-Process MSIEXEC.exe -ArgumentList "/I $SoftwarePath /quiet /qn /norestart" -Wait -Verb RunAs -PassThru
