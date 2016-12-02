Copy-Item $env:HOME"\.vimrc" $PSScriptRoot"\Vim" -Force -Confirm

function Push-VimMisc
{
$VimInstallPath = 'C:\Program Files (x86)\Vim'
$message  = "Copying vimfiles in $VimInstallPath"
$question = 'Proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
    Copy-Item $VimInstallPath'\vimfiles' $PSScriptRoot"\Vim" -Recurse -Force
} else {

}
}

Push-VimMisc
#Copy-Item $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $PSScriptRoot"\Chrome\Stylish" -Recurse -Force -Confirm
Copy-Item $env:ConEmuDir"\ConEmu.xml" $PSScriptRoot"\ConEmu" -Force -Confirm
Copy-item $PROFILE $PSScriptRoot"\Powershell" -Force -Confirm
echo "Pushing to Git"
$Time = Get-Date
Push-Location
cd $PSScriptRoot
git commit -a -m "Pushed: $Time"
git push -v
Pop-Location
