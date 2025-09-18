Write-Host "=== System Health Check ===" -ForegroundColor Green

# Uptime
$uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
Write-Host "System Uptime:" (Get-Date) - $uptime

# CPU Usage
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
Write-Host "CPU Usage:" $cpu.CounterSamples.CookedValue "%"

# Memory Usage
$mem = Get-Counter '\Memory\Available MBytes'
Write-Host "Available Memory:" $mem.CounterSamples.CookedValue "MB"

# Disk Usage
Get-PSDrive -PSProvider 'FileSystem' | 
Select-Object Name, Used, Free