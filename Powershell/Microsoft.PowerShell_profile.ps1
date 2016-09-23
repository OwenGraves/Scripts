# Load posh-git example profile
. 'C:\Users\Owen\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'
cd 'C:\Users\Owen\Desktop'

# Load extra registry drives
New-PSDrive -PSProvider Registry -Root HKEY_CLASSES_ROOT -Name HKCR > $null

# Create useful aliases
New-Alias -Name nip -Value New-ItemProperty

function gald {
Param(
    [string]$item
)
Get-Alias -Definition $item
}