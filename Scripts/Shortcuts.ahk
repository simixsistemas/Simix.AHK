; ================================================================================
; Shortcuts
; ================================================================================

; Screen capture related
^PrintScreen::RunExe("C:\ProgramData\chocolatey\lib\screentogif\content\ScreenToGif.exe", "C:\Program Files (x86)\ScreenToGif\ScreenToGif.exe")
!PrintScreen::Send, #+s

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

; Slack (Focus and jump)
#s::
    WinActivate, ahk_exe slack.exe
    Send, ^k ; Jump
return

; cmd as admin
#c::
    Send, #r
    Sleep, 400
    Send, cmd
    Send, +^{Enter}
return

; Notepad++
#Space::
    If WinExist("ahk_exe notepad++.exe")
        WinActivate
    else
        Run, notepad++
return

; Run selected text
#Enter::
    CopyToClipboard()
    Run, %Clipboard%
return
