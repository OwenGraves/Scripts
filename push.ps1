Copy-Item $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $PSScriptRoot"\Chrome\Stylish" -Recurse -Force -Confirm
Copy-Item "C:\Program Files\ConEmu\ConEmu.xml" $PSScriptRoot"\ConEmu" -Force -Confirm
Copy-item "~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" $PSScriptRoot"\Powershell" -Force -Confirm
Copy-Item "~\_vimrc" $PSScriptRoot"\Vim" -Force -Confirm