# Set notes in vms

$vcenter_host = "vcenter.br.example.online"

Connect-VIServer -Server $vcenter_host -force

$VMsToSet = @("VM01","VM02","VM03","VM04")

foreach ($VMSet in $VMsToSet) {            
    $add_note = " enter the text here  "
    $oldNote = (get-vm $VMSet).Notes
    $new_note =  $add_note+$oldNote
    get-vm $VMSet | set-vm -Notes $new_note -Confirm:$false
    (get-vm $VMSet).Notes
}

Disconnect-VIServer -Server $vcenter_host -Confirm:$false
