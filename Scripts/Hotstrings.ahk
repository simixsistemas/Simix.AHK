; ================================================================================
; Hotstrings
; https://autohotkey.com/docs/Hotstrings.htm
; ================================================================================

; Date
:*:;dm::
    FormatTime, CurrentDateTime,, dd/MM/yyyy
    SendInput %CurrentDateTime%
return
:*:;ym::
    FormatTime, CurrentDateTime,, yyyyMMdd
    SendInput %CurrentDateTime%
return

; Downloads
:*:;az::http://az01.simix.com.br:81/Arquivos/

; New PR template
:*:;pr::
    PasteTemplateFromFile("pr")
return

; Release documentation template
:*:;releasedoc::
    PasteTemplateFromFile("releasedoc")
return

; Register PcPonto files
:*:;regpp::
    PasteTemplateFromFile("regpp", true)
return
