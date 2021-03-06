Clear-Host
Import-Module NTFSSecurity
$Logs = Get-ChildItem -Recurse -Force -Path "$Env:APPDATA\.purple\logs" -WarningAction:SilentlyContinue
$Temp = Get-ChildItem -Recurse -Force -Path "$Env:TEMP" -WarningAction:SilentlyContinue
$Logs,$Temp | ForEach-Object {
	$_ | Enable-Inheritance -WarningAction:SilentlyContinue
	$_ | Remove-Item -Confirm:$false -Recurse -Force -WarningAction:SilentlyContinue
}

