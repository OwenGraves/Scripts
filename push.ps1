Copy-Item "~\_vimrc" $PSScriptRoot"\Vim" -Force -Confirm
#Copy-Item $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $PSScriptRoot"\Chrome\Stylish" -Recurse -Force -Confirm
Copy-Item "C:\Program Files\ConEmu\ConEmu.xml" $PSScriptRoot"\ConEmu" -Force -Confirm
Copy-item $PROFILE $PSScriptRoot"\Powershell" -Force -Confirm
echo "Pushing to Git"
git commit -a -m "Pushed"