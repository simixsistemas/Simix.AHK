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
	rootDir := LevelUpScriptDir(1)
		FileCreateShortcut, "%rootDir%\Simix.AHK.ahk", %A_Startup%\Simix.AHK.lnk, %rootDir%,, Simix desktop automation, %rootDir%\Icon.ico, i
}

LevelUpScriptDir(n){
	return SubStr(A_ScriptDir,1,!InStr(A_ScriptDir,"\",0,-1,n) ? InStr(A_ScriptDir,"\",0,1,1) : InStr(A_ScriptDir,"\",0,-1,n))
}
