# Load posh-git example profile
. 'C:\Users\Owen\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

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
New-Alias -Name s -Value Stack

function Get-DirectoryForce {
ls -Force @args
}
New-Alias -Name la -Value Get-DirectoryForce

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

function Build-Stack {
    param([string]$x)
    $projectName = [io.path]::GetFileNameWithoutExtension($PWD)
    stack build $projectName
    stack exec $projectName
}
New-Alias -Name b -Value Build-Stack
