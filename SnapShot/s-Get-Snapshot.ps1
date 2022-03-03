# Get VMs with shapshots older than 7 days by Powers CLI.

Connect-VIServer -Server vcenter.br.example.online -force

$Now = Get-Date
$SnapDate = (Get-VM | Get-Snapshot).created
$SnapVM = Get-VM | Get-Snapshot
Write-Host "There are"($SnapVM).count"snapshots." -ForegroundColor DarkYellow

if( $SnapDate -lt $Now.AddDays(-7)){
    Write-Host "There are snapshots with more than 7 days. " -ForegroundColor DarkYellow
    $snp = (Get-VM | Get-Snapshot).VM
    Write-Host "VMs with snapshot grather than 7 days "$snp -ForegroundColor DarkBlue
}

Disconnect-VIServer -Server vcenter.br.example.online -Confirm:$false