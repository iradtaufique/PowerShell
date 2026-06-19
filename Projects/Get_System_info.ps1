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

Write-Host "Operating System: $($os.Caption)" # caption gets the name of the OS
Write-Host "OS Version: $($os.Version)"

# Win32_Processor is the WMI class or table for CPU Information.
# it returns one object per physical cpu, so we grab the fisrt with [0]
Write-Host "`n<--------> CPU Info <-------->" -ForegroundColor Cyan

$cpu = Get-CimInstance -ClassName Win32_Processor

Write-Host "CPU Name: $($cpu.Name)" # get cpu name
Write-Host "Number of Core: $($cpu.NumberOfCores) Cores" # Number of core

# Win32_OperatingSystem (which we store in $os variable) also holds memory info.
# TotalVisibleMemorySize and FreePhysicalMemory are in KILOBYTES, so we
# Divide by 1MB to Convert to GB.
# [math]::Round() Rounds the number to 2 decimal places

Write-Host "`n<-------> RAM Space <------->" -ForegroundColor Cyan

$totalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeRAM = [math]::Round($os.FreePhysicalMemory /1MB, 2)
$usedRAM = [math]::Round($totalRAM - $freeRAM, 2)

Write-Host "Total RAM: $($totalRAM) GB"
Write-Host "Used RAM: $($usedRAM) GB"
Write-Host "Free RAM: $($freeRAM) GB"

# Get-PSDrive Retrieves all drives on the system
# -PSProvider FileSystem filters to only real disk drives (not registry, ..etc)

$drives = Get-PSDrive -PSProvider FileSystem # only get real disk drive
Write-Host "`n<-------> Disk Space <------->" -ForegroundColor Cyan

# loop through each drive
foreach($drive in $drives){
    # used and free drive are in bytes, so we will divide by 1GB to convert
    $usedDrive = [math]::Round($drive.Used / 1GB, 2)
    $freeDrive = [math]::Round($drive.Free /1GB, 2)
    $totalDrive = [math]::Round(($drive.Used + $drive.Free) / 1GB, 2)

    Write-Host "Drive Name $($drive.Name)"
    Write-Host "Total Space: $($totalDrive) GB"
    Write-Host "Used Space: $($usedDrive) GB"
    Write-Host "Free Space: $($freeDrive) GB"

}

Write-Host "======== END SYSTEM INFORMATION REPORT ======== `n" -ForegroundColor Cyan