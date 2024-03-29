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

; Paste. Simulated, for: ignore formating, paste file paths and TS with clipboard disabled
^+v::Send, %Clipboard%

; Repo site
#F1::Run, https://simix.movidesk.com/kb/pt-br/article/60634/todos-links

; KB Links
#F2::Run, https://github.com/simixsistemas/Simix.AHK#teclas-de-atalhos

; Generate html snippet for image url
#if WinBrowser()
^i::
    Send ^x
    var := SubStr(clipboard, InStr(clipboard, "(") + 1, InStr(clipboard, ")") - InStr(clipboard, "(") - 1)

    FileEncoding , UTF-8
    FileRead, Clipboard, %A_ScriptDir%\Templates\img.txt

    Clipboard := StrReplace(Clipboard, "imageURL", var)
    sleep 100
    Send ^v
    return
#If

; TeamViewer/AnyDesk
#t::
    CopyToClipboard()
    Run, "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"
    Run, "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
return

; Clear Windows notifications
#Esc::
    Send, #a
    Sleep, 500
    Send, {Tab}{Tab}{Tab}{Tab}{Tab}
    Sleep, 500
    Send, {Space}{Esc}
return
