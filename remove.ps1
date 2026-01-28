<#
.SYNOPSIS
    Short description of what the script does.

.DESCRIPTION
    Detailed explanation of the script's purpose, logic, and context.

.AUTHOR
    Charles Hebert

.VERSION
    1.0.0

.DATE
    2026-01-28

.LASTEDIT
    2026-01-28 — Fix Service Removal.

.COMPANY
    Les Solutions One-Sky

.NOTES
    
#>
``

$Regedit_products = "HKLM:\SOFTWARE\Classes\Installer\Products"
$ScreenConnect_Folder = "C:\Program Files (x86)\ScreenConnect Client (5c771d1213e4b96b)"


#Kill service SC 
Stop-Service -Name "ScreenConnect Client (5c771d1213e4b96b)" -Force
sc.exe delete "ScreenConnect Client (5c771d1213e4b96b)"

#Supprimer dossier ScreenConnect
if(test-path $ScreenConnect_Folder)
{
    Remove-Item -Path $ScreenConnect_Folder -Recurse -Force
    Write-Host "Dossier supprimé"
}

#Trouver sous-cle correspondant a notre instance SC
$Cle_PRODUCT = Get-ChildItem -Path $Regedit_products
foreach ($SOUS_CLE in $Cle_PRODUCT)
{
    $Proprietes = Get-ItemProperty -Path $SOUS_CLE.psPath 
    #Déterminer si c'est screenconnect ou non
    if ($Proprietes.ProductName -and ($Proprietes.ProductName -like "*5c771d1213e4b96b*"))
        {
        Remove-Item -Path $SOUS_CLE.PSPath -Recurse -Force
	Write-Host "Clé supprimée"
        }
}
