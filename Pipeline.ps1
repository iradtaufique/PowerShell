$serviceName = 'spooler'

Get-Service -Name $serviceName

# Using Get-Help Command for command detail
Get-Help -Name Start-Service -Full

## ============== Using Pipeline to get a service and start the that service ==================

Get-service -Name $serviceName | Start-Service


## Using ArrayList to get more services and use pipeline to take action on the service

$services = New-Object -TypeName System.Collections.ArrayList

$services.AddRange(@('spooler', 'w32time'))

# using Pipeline to get the status of the services listed in services arraylist

$services | Get-Service # serives contain serives name and we use Pipeline to get the services

# Get services and stopped/start the service

$services | Get-Service | Start-Service

# Using write-output and foreach to output the custom messages

$services | Get-Service | ForEach-Object{Write-Output "Service: $($_.displayname) is Currently $($_.status)"}