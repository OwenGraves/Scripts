echo "Replacing from Git"
Push-Location
cd $PSScriptRoot
git fetch --all
git reset --hard origin/master
Pop-Location

function Copy-VimMisc
{
$VimInstallPath = 'C:\Program Files (x86)\Vim'
$message  = "Copying vimfiles and creating dir vimtemp if it does not exist in $VimInstallPath"
$question = 'Proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  if((Test-Path $VimInstallPath'\vimtemp') -eq 0)
{
    mkdir $VimInstallPath'\vimtemp'
}
Copy-Item $PSScriptRoot"\Vim\vimfiles" $VimInstallPath -Recurse -Force
} else {

}
}

Copy-Item $PSScriptRoot"\Vim\.vimrc" $env:HOME"\.vimrc" -Force -Confirm
Copy-VimMisc
Copy-Item $PSScriptRoot"\ConEmu\ConEmu.xml" $env:ConEmuDir"\ConEmu.xml" -Force -Confirm
Copy-Item $PSScriptRoot"\Powershell\Microsoft.PowerShell_profile.ps1" $Profile -Force -Confirm

function Copy-Stylish
{
$message  = "Removing and copying $env:LOCALAPPDATA\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0"
$question = 'Proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  Remove-Item $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" -Recurse -Force
  Copy-Item $PSScriptRoot"\Chrome\Stylish\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases" -Recurse -Force
} else {

}
}
