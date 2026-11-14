#!powershell
#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
    options = @{
        path = @{ type = 'str'; default = '/' }
    }
    supports_check_mode = $true
}
$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$drive = Get-PSDrive -PSProvider FileSystem | Where-Object Root -eq $module.Params.path
$module.Result.free_gb = [math]::Round($drive.Free / 1GB, 1)
$module.Result.used_gb = [math]::Round($drive.Used / 1GB, 1)
$module.Result.powershell = $PSVersionTable.PSVersion.ToString()
$module.Result.os = $PSVersionTable.OS
$module.ExitJson()
