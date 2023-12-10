# Bring back old right-click menu
$regPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
Set-ItemProperty -Path $regPath -Name "(default)" -Value ""

# Disable Network connection while on modern standby
powercfg /setdcvalueindex scheme_current sub_none F15576E8-98B7-4186-B944-EAFA664402D9 0

# Delete widgets
# Remove the installed package for each user
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like '*WebExperience*'} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

Write-Host "Setup completed successfully."
Pause
