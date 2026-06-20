# 🖥️ PowerShell System Information Reporter

A beginner-friendly PowerShell script that automatically collects and exports key machine details to a text file — hostname, OS version, uptime, CPU, RAM, and disk space — all in one run.

This is **Project 1 of 10** in a hands-on PowerShell learning series focused on Sysadmin / IT Ops skills.

---

## 📋 What It Does

- Displays the machine **hostname**
- Reports the **OS name and version**
- Calculates **system uptime** (days, hours, minutes)
- Shows **CPU name and core count**
- Breaks down **RAM** (total, used, and free)
- Lists all **disk drives** with total, used, and free space
- **Exports the full report** to a `.txt` file saved next to the script
- **Displays output on screen AND saves to file** at the same time using `Tee-Object`

---

## 🚀 How to Use

1. Clone or download this repository
2. Open PowerShell as Administrator
3. Navigate to the folder containing the script:
   ```powershell
   cd C:\Path\To\Script
   ```
4. Run the script:
   ```powershell
   .\Get-SystemInfo.ps1
   ```
5. Find your report saved as `systemReport.txt` in the same folder

---

## 🔧 Key Cmdlets Used

| Cmdlet | Purpose |
|---|---|
| `Get-CimInstance` | Queries Windows WMI (Window Management Instrumentation) to pull OS, CPU, and hardware info |
`Win32_OperatingSystem` | WMI Class for OS information |
`Win32_Processor` | WMI class for CPU Inforamtion
| `Get-PSDrive` | Retrieves disk drives and their used/free space |
| `Get-Date` | Gets the current date/time and calculates uptime |
| `Write-Output` | Sends data into the pipeline so it can be captured and saved |
| `Tee-Object` | Outputs to the screen AND a file simultaneously |
| `Out-File` | Saves script output directly to a `.txt` file |

> 💡 **Key lesson:** `Write-Host` and `Write-Output` are NOT the same.
> `Write-Host` prints to the screen only and bypasses the pipeline.
> `Write-Output` feeds the pipeline — which is what makes saving to a file possible.

---

## 📄 Sample Output

```
========== SYSTEM INFORMATION REPORT ==========

HostName: ComputerName

Operating System: Microsoft Windows 11 Home
OS Version: 10.0.26200

<--------> CPU Info <-------->
CPU Name: 12th Gen Intel(R) Core(TM) i7-1260P
Number of Core: 12 Cores
System Uptime: 7 days, 22 hours, 46

<-------> RAM Space <------->
Total RAM: 15.69 GB
Used RAM: 13.24 GB
Free RAM: 2.45 GB

<-------> Disk Space <------->
Drive Name C
Total Space: 480.61 GB
Used Space: 300.39 GB
Free Space: 88.22 GB
======== END SYSTEM INFORMATION REPORT at 06/19/2026 22:21:01 ========
```

---

## 🧠 What I Learned

- How to query system hardware info using **WMI via `Get-CimInstance`**
- The difference between **`Write-Host`** (screen only) and **`Write-Output`** (pipeline-friendly)
- How to use **`Tee-Object`** to write to both the screen and a file at the same time
- How to use **`foreach` loops** to iterate over multiple drives

---

## 📌 Requirements

- Windows PowerShell 5.1+ or PowerShell 7+
- Windows OS (uses WMI/CIM classes specific to Windows)

---

## 🗺️ Learning Project List

- [x] Project 1 — System Info Reporter
- [ ] Project 2 — Folder Cleanup Script
- [ ] Project 3 — Ping Sweeper
- [ ] Project 4 — Local User Account Manager
- [ ] Project 5 — Windows Service Monitor
- [ ] Project 6 — Log File Analyzer
- [ ] Project 7 — Automated Backup Script
- [ ] Project 8 — Software Inventory Tool
- [ ] Project 9 — Disk Space Alert Script
- [ ] Project 10 — IT Onboarding Automation Script

---

## 👤 Author

Taufique Iradukunda

`#PowerShell` `#ITOps` `#SysAdmin` `Devops` `automation`
