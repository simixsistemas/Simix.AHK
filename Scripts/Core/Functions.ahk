; ================================================================================
; Functions
; ================================================================================

RunBrowser() {
    If WinExist("- Google Chrome")
        WinActivate
    else
        Run chrome
    WinWaitActive, - Google Chrome, , 5
    Sleep 300
    Send, ^t
}

NotifyEx(title, message, duration=4) {
    Notify(title, message, duration, "Style=Win10")
}

DoubleTapRun(cmd){
    if DoubleTap()
        Run %cmd%
}

DoubleTapSend(keys){
    if DoubleTap()
        Send %keys%
}

DoubleTap(){
    return (A_ThisHotkey = A_PriorHotkey) && (A_TimeSincePriorHotkey < 300)
}

WinDev(){
    return (WinActive("ahk_exe Code.exe") or WinActive("ahk_exe devenv.exe"))
}

WinCRM(){
    return WinActive("ahk_exe SimixCRM.Win.exe")
}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

MouseIsOverTaskbar() {
    return MouseIsOver("ahk_class Shell_TrayWnd")
}

MouseIsTop() {
    MouseGetPos,x,y
    return (y <= 1)
}

MouseIsLeft() {
    MouseGetPos,x,y
    return (x <= 5) and (y <= 800)
}

MonitorOn() {
    SendMessage 0x112, 0xF170, -1, , Program Manager
}

MonitorOff() {
    SendMessage 0x112, 0xF170, 2, , Program Manager
}

ShowOSD(str, timeout) {
    CustomColor = EEAA99

    Gui, 2: Default
    Gui, destroy    
    Gui, +AlwaysOnTop +LastFound +Owner -Caption
    Gui, Color, %CustomColor%
    Gui, Font, s30
    ;Gui, Add, Text, x2 y2 c000000 BackgroundTrans, %str%
    Gui, Add, Text, x0 y0 cLime BackgroundTrans, %str%

    WinSet, TransColor, %CustomColor% 150
    Gui,  Show, NoActivate center center
    Sleep, timeout
    Gui, destroy
}

UCase(str) {
    StringUpper, str, str
    return str
}

GetParentPath(path) {
    return SubStr(path, 1, InStr(SubStr(path, 1, -1), "\", 0, 0) -1)
}

GetActiveWindowId() {
    WinGet, activeHwnd, ID, A
    return activeHwnd
}

CopyToClipboard() {
    Clipboard := ""
    Send, ^c
    ClipWait
}

CopyToClipboard2() {
    Clipboard := ""
    Send, ^+c
    ClipWait
}

RunTS(path, pwd, name) {
    NotifyEx("TS", name)
    Run, %path%
    WinWaitActive, ahk_exe CredentialUIBroker.exe, , 7
    Clipboard = %pwd%
    Send, %pwd%{Enter}
}
