; ================================================================================
; AutoHotkey
; ================================================================================

SaveReload() {
    Send ^ks ; Save all (VS Code)
    Sleep 500
    ShowOSD("Ok", 500)
    Reload
}

; Edit AHK VS Code project
CapsLock & a::Run, %A_ScriptDir%\Simix.AHK.code-workspace

; Reload
CapsLock & r::
    ShowOSD("Ok", 500)
    Reload
return
#If WinActive("AutoHotkey")
F12::SaveReload()
#If
