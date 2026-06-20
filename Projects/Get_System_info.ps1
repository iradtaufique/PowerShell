# =======================================
# Script Name: Get_system_info.ps1
# Purpose: Report Systemp Information
# =======================================

$outPutPath = "C:\Users\iradu\Downloads\Scripts\Projects\systemReport.txt"

&{
    # $env:COMPUTERNAME this is a built-in environment variable tha
# holds the name of the current machine.
$hostname = $env:COMPUTERNAME

#print text to the screen with ForeGroungColor of cyan using write-host 
Write-Output "========== SYSTEM INFORMATION REPORT ========== `n" -ForegroundColor Cyan
Write-Output "HostName: $($hostname) `n"



# Get-CimInstance, queries Windows Managment instrumentation (WMI),
# Which is a builtin windows database of system information.
# Win32_OperatingSystem is the specific 'table' that hold os details.
$os = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Output "Operating System: $($os.Caption)" # caption gets the name of the OS
Write-Output "OS Version: $($os.Version)"

# Win32_Processor is the WMI class or table for CPU Information.
# it returns one object per physical cpu, so we grab the fisrt with [0]
Write-Output "`n<--------> CPU Info <-------->" -ForegroundColor Cyan

$cpu = Get-CimInstance -ClassName Win32_Processor

Write-Output "CPU Name: $($cpu.Name)" # get cpu name
Write-Output "Number of Core: $($cpu.NumberOfCores) Cores" # Number of core


# Get System Uptime
# $os.LastBootUptime give us the last time machine was booted.
# Get-Date give us the current Date and time
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Output "System Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes)" -ForegroundColor Cyan


# Win32_OperatingSystem (which we store in $os variable) also holds memory info.
# TotalVisibleMemorySize and FreePhysicalMemory are in KILOBYTES, so we
# Divide by 1MB to Convert to GB.
# [math]::Round() Rounds the number to 2 decimal places

Write-Output "`n<-------> RAM Space <------->" -ForegroundColor Cyan

$totalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeRAM = [math]::Round($os.FreePhysicalMemory /1MB, 2)
$usedRAM = [math]::Round($totalRAM - $freeRAM, 2)

Write-Output "Total RAM: $($totalRAM) GB"
Write-Output "Used RAM: $($usedRAM) GB"
Write-Output "Free RAM: $($freeRAM) GB"

# Get-PSDrive Retrieves all drives on the system
# -PSProvider FileSystem filters to only real disk drives (not registry, ..etc)

$drives = Get-PSDrive -PSProvider FileSystem # only get real disk drive
Write-Output "`n<-------> Disk Space <------->" -ForegroundColor Cyan

# loop through each drive
foreach($drive in $drives){
    # used and free drive are in bytes, so we will divide by 1GB to convert
    $usedDrive = [math]::Round($drive.Used / 1GB, 2)
    $freeDrive = [math]::Round($drive.Free /1GB, 2)
    $totalDrive = [math]::Round(($drive.Used + $drive.Free) / 1GB, 2)

    Write-Output "Drive Name $($drive.Name)"
    Write-Output "Total Space: $($totalDrive) GB"
    Write-Output "Used Space: $($usedDrive) GB"
    Write-Output "Free Space: $($freeDrive) GB"

}

$dates = Get-Date

Write-Output "======== END SYSTEM INFORMATION REPORT at $($dates) ======== `n" -ForegroundColor Cyan | Out-File -FilePath "C:\Users\iradu\Downloads\Scripts\system"

} | Tee-Object -FilePath $outPutPath