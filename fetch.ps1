Copy-Item $PSScriptRoot"\Vim\_vimrc" "~\_vimrc" -Force -Confirm
Copy-Item $PSScriptRoot"\Chrome\Stylish\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" $env:LOCALAPPDATA"\Google\Chrome\User Data\Default\databases\chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0" -Recurse -Force -Confirm
Copy-Item $PSScriptRoot"\ConEmu\ConEmu.xml" "C:\Program Files\ConEmu\ConEmu.xml" -Force -Confirm
Copy-Item $PSScriptRoot"\Powershell\Microsoft.PowerShell_profile.ps1" "~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Force -Confirm