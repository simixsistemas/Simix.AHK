; ================================================================================
; Main script (called in shell:startup)
; ================================================================================

; Tray
Menu, Tray, Icon , %A_ScriptDir%\Icon.ico
Menu, Tray, Tip , SMX AHK

; Settings
#SingleInstance, Force
#NoEnv
SetNumLockState, AlwaysOn
CoordMode, Mouse, Screen
SetTitleMatchMode 2

; Includes (Libs)
#Include Libs\AHKHID.ahk
#Include Libs\Ini.ahk
#Include Libs\Notify.ahk

; Includes (Core)
#Include Scripts\Core\Functions.ahk
#Include Scripts\Core\VirtualDesktop.ahk

; Includes (Scripts)
#Include Scripts\Hotstrings.ahk
#Include Scripts\HotstringsEmoji.ahk
#Include Scripts\Shortcuts.ahk
