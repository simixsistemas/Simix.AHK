; ================================================================================
; Virtual Desktop function
; https://github.com/sdias/win-10-virtual-desktop-enhancer
; ================================================================================

global MoveWindowToDesktopNumberProc
global GetCurrentDesktopNumberProc
global GoToDesktopNumberProc
global GetDesktopCountProc

LoadVirtualDesktopAccessor() {
    hVirtualDesktopAccessor := DllCall("LoadLibrary", "Str", A_ScriptDir . "\Libs\virtual-desktop-accessor.dll", "Ptr")
    GoToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GoToDesktopNumber", "Ptr")
    MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "MoveWindowToDesktopNumber", "Ptr")
    GetCurrentDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetCurrentDesktopNumber", "Ptr")
    GetDesktopCountProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetDesktopCount", "Ptr")
}

MoveActiveWindowToDesktop(n:=1){
    hWnd := GetActiveWindowId()
    DllCall(MoveWindowToDesktopNumberProc, UInt, hWnd, UInt, n-1)
}

SwitchToNextDesktop() {
    ChangeDesktop(GetNextDesktopNumber())
}

SwitchToPrevDesktop() {
    ChangeDesktop(GetPreviousDesktopNumber())
}

ChangeDesktop(n:=1) {
    if (n == 0) {
        n := 10
    }
    DllCall(GoToDesktopNumberProc, Int, n-1)
}

GetNextDesktopNumber() {
    i := GetCurrentDesktopNumber()
    i := (i == GetNumberOfDesktops() ? 1 : i + 1)
    return i
}

GetPreviousDesktopNumber() {
    i := GetCurrentDesktopNumber()
	i := (i == 1 ? GetNumberOfDesktops() : i - 1)	
    return i
}

GetCurrentDesktopNumber() {
    return DllCall(GetCurrentDesktopNumberProc) + 1
}

GetNumberOfDesktops() {
    return DllCall(GetDesktopCountProc)
}
