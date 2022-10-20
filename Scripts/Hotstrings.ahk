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
:*:;download::https://www.dropbox.com/scl/fo/t10n1gw846qb3xghwnepr/h?dl=0&rlkey=3n6r5g6l8snqdvzb6jd8xh7b8

; KBs
:*:;performance::https://simix.movidesk.com/kb/article/265686/monitorar-performance-servicos
:*:;sqls::https://github.com/simixsistemas/SQL

; New PR template
:*:;pr::
    PasteTemplateFromFile("pr")
return

; New Issue Template
:*:;issue::
    PasteTemplateFromFile("issue")
return

; Release documentation template
:*:;releasedoc::
    PasteTemplateFromFile("releasedoc")
return

; Register PcPonto files
:*:;regpp::
    PasteTemplateFromFile("regpp", true)
return
