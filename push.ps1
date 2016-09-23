Copy-Item $env:HOME"\_vimrc" $PSScriptRoot"\Vim" -Force -Confirm
#Copy-Item $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $PSScriptRoot"\Chrome\Stylish" -Recurse -Force -Confirm
Copy-Item $env:ConEmuDir"\ConEmu.xml" $PSScriptRoot"\ConEmu" -Force -Confirm
Copy-item $PROFILE $PSScriptRoot"\Powershell" -Force -Confirm
echo "Pushing to Git"
$Time = Get-Date
git commit -a -m "Pushed: $Time"
git push