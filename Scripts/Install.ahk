; ================================================================================
; Install
; ================================================================================

; Copy Greenshot settings if not exists
if (!FileExist("%A_AppData%\Greenshot\Greenshot.ini")){
	IfNotExist, %A_AppData%\Greenshot\
	  FileCreateDir, %A_AppData%\Greenshot\
	FileCopy, %A_ScriptDir%\Templates\Greenshot.ini, %A_AppData%\Greenshot\
}

; Install screenToGif powershell command
psScript =
(
	"iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
	"choco feature enable -n allowGlobalConfirmation;cinst autohotkey.install;cinst --force screentogif;cinst --force greenshot"
)

; Install screenToGif if not installed
if (!FileExist("C:\ProgramData\chocolatey\lib\screentogif\content\ScreenToGif.exe")
 and !FileExist("C:\Program Files (x86)\ScreenToGif\ScreenToGif.exe")) {
	RunWait PowerShell.exe -NoExit -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command &{%psScript%}
}

; Create a script shortcut
if (!FileExist("%A_Startup%\Simix.AHK.lnk")) {
	FileCreateShortcut, "%A_ScriptFullPath%", %A_Startup%\Simix.AHK.lnk, %A_ScriptDir%,, Simix desktop automation, %A_ScriptDir%\Icon.ico, i
}