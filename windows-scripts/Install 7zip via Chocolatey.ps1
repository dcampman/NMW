#description: Installs 7zip via Chocolatey Package Manager (https://chocolatey.org/)
#execution mode: Combined
#tags: Nerdio, Apps install, Chocolatey
<#
This script installs 7Zip via Chocolatey
#>

# Install Chocolatey if it isn't already installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install 7zip
choco upgrade 7zip -y --force

