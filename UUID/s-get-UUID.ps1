# Get host UUID
Connect-VIServer -Server host.br.example.online -force

Get-View -ViewType HostSystem -Property Name,hardware.systeminfo | Select-Object Name,@{N="UUID";E={$_.hardware.systeminfo.uuid}}

Disconnect-VIServer -Server host.br.example.online -Confirm:$false
