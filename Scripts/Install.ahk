; ================================================================================
; Install
; ================================================================================

; Install screenToGif powershell command
; Copy Greenshot settings if not exists
; Install screenToGif if not installed
; Create a script shortcut
CheckInstall() {
	if (!FileExist("%A_AppData%\Greenshot\Greenshot.ini")){
		IfNotExist, %A_AppData%\Greenshot\
		  FileCreateDir, %A_AppData%\Greenshot\
		FileCopy, %A_ScriptDir%\Templates\Greenshot.ini, %A_AppData%\Greenshot\
	}
	
	if (!FileExist("C:\ProgramData\chocolatey\lib\screentogif\content\ScreenToGif.exe")
	 and !FileExist("C:\Program Files (x86)\ScreenToGif\ScreenToGif.exe")) {
			Send, #r
			WinWait, Executar, , 5
			Clipboard = cmd /C @"`%SystemRoot`%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=`%PATH`%;`%ALLUSERSPROFILE`%\chocolatey\bin"
			Send, ^v
			Send, ^+{enter}
			
			Sleep 8000
			
			Send, #r
			WinWait, Executar, , 5
			Clipboard = cmd /k @"`%SystemRoot`%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "choco feature enable -n allowGlobalConfirmation;cinst autohotkey.install;cinst --force screentogif;cinst --force greenshot"
			Send, ^v
			Send, ^+{enter}
	}
	
	if (!FileExist("%A_Startup%\Simix.AHK.lnk")) {
		FileCreateShortcut, "%A_ScriptDir%\Simix.AHK.ahk", %A_Startup%\Simix.AHK.lnk, %A_ScriptDir%,, Simix desktop automation, %A_ScriptDir%\Icon.ico, i
	}
}
