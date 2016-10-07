﻿# Load posh-git example profile
. 'C:\Users\Owen\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'
cd 'C:\Users\Owen\Desktop'

# Load extra registry drives
New-PSDrive -PSProvider Registry -Root HKEY_CLASSES_ROOT -Name HKCR > $null

# Create useful aliases
New-Alias -Name nip -Value New-ItemProperty
New-Alias -Name less -Value 'C:\Program Files (x86)\GnuWin32\bin\less.exe'
New-Alias -Name l -Value less
New-Alias -Name v -Value vim
New-Alias -Name c -Value Clear-Host
New-Alias -Name cc -Value Clear-Host
New-Alias -Name o -Value Clear-Host

function Get-AliasDefinition {
Get-Alias -Definition @args
}
New-Alias -Name gald -Value Get-AliasDefinition

function Set-Path {
    param([string]$x)
    $Env:Path+= ";" +  $x
    Write-Output $Env:Path
    $write = Read-Host 'Set PATH permanently ? (yes|no)'
    if ($write -eq "yes")
    {
        [Environment]::SetEnvironmentVariable("Path",$env:Path, [System.EnvironmentVariableTarget]::User)
        Write-Output 'PATH updated'
    }

}
