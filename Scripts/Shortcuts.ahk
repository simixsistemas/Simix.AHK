; ================================================================================
; Shortcuts
; ================================================================================

#If WinExist("ahk_exe ScreenToGif.exe")
Pause::
    Send, {F8}
    WinWait, ScreenToGif - Editor, , 5
    WinActivate, ScreenToGif - Editor
    Sleep, 500
    Send, ^s
    Sleep, 2000
    Send, !e
    Sleep, 3000
    WinMinimize, ScreenToGif - Editor
return
#If

^PrintScreen::RunExe("C:\ProgramData\chocolatey\lib\screentogif\content\ScreenToGif.exe", "C:\Program Files (x86)\ScreenToGif\ScreenToGif.exe")
!PrintScreen::Send, #+s
