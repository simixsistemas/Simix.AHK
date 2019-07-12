; ================================================================================
; Hotstrings
; https://autohotkey.com/docs/Hotstrings.htm
; ================================================================================

; Date
:*:;d::
    FormatTime, CurrentDateTime,, yyyyMMdd
    SendInput %CurrentDateTime%
return

; PR
:*:;pr::
    FileEncoding , UTF-8
    FileRead, Clipboard, %A_ScriptDir%\Templates\pr.txt
    Send, ^v
return
