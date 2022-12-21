#description: Downloads and installs ZScaler for WVD. 
#execution mode: IndividualWithRestart
#tags: Apps install
<# 
Notes:
This script installs the ZScaler for use on WVD Session hosts.

To install specific versions, update the URL variables below with links to the .msi installers.
#>

$ZScalerClientURL = "https://d32a6ru7mhaq0c.cloudfront.net/Zscaler-windows-3.9.0.183-installer-x64.exe"

# Start powershell logging
$SaveVerbosePreference = $VerbosePreference
$VerbosePreference = 'continue'
$VMTime = Get-Date
$LogTime = $VMTime.ToUniversalTime()
mkdir "C:\Windows\temp\NerdioManagerLogs\ScriptedActions\zscaler" -Force
Start-Transcript -Path "C:\Windows\temp\NerdioManagerLogs\ScriptedActions\zscaler\ps_log.txt" -Append
Write-Host "################# New Script Run #################"
Write-host "Current time (UTC-0): $LogTime"

# Make directory to hold install files
mkdir "C:\Windows\Temp\zscaler\install" -Force

Invoke-WebRequest -Uri $ZScalerClientURL -OutFile "C:\Windows\Temp\zscaler\install\ZScaler-installer-x64.exe" -UseBasicParsing

# Install ZScaler.
Write-Host "INFO: Installing ZScaler. . ."
Start-Process C:\Windows\System32\msiexec.exe `
    -ArgumentList "/i C:\Windows\Temp\zscaler\install\ZScaler-installer-x64.exe /l*v C:\Windows\Temp\NerdioManagerLogs\ScriptedActions\zscaler\ZScaler_install_log.txt /qn /norestart" -Wait
Write-Host "INFO: ZScaler install finished."

# End Logging
Stop-Transcript
$VerbosePreference = $SaveVerbosePreference
