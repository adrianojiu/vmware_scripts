#Get VM OS

$vcenter_host = "vcenter.br.example.online"
Connect-VIServer -Server $vcenter_host -force

Get-VM | Sort-Object | Get-View -Property @("Name", "Config.GuestFullName", "Guest.GuestFullName") | Select-Object -Property Name, @{N="Configured OS";E={$_.Config.GuestFullName}},  @{N="Running OS";E={$_.Guest.GuestFullName}} | Format-Table -AutoSize

Disconnect-VIServer -Server $vcenter_host -Confirm:$false
