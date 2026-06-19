# =======================================
# Script Name: Get_system_info.ps1
# Purpose: Report Systemp Information
# =======================================

# $env:COMPUTERNAME this is a built-in environment variable tha
# holds the name of the current machine.
$hostname = $env:COMPUTERNAME

#print text to the screen with ForeGroungColor of cyan using write-host 
Write-Host "========== SYSTEM INFORMATION REPORT ========== `n" -ForegroundColor Cyan
Write-Host "HostName: $($hostname) `n"


# Get-CimInstance, queries Windows Managment instrumentation (WMI),
# Which is a builtin windows database of system information.
# Win32_OperatingSystem is the specific 'table' that hold os details.
$os = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Host "Operating System: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"


Write-Host "======== END SYSTEM INFORMATION REPORT ======== `n" -ForegroundColor Cyan