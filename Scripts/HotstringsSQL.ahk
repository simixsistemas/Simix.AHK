; ================================================================================
; Hotstrings for SQL
; ================================================================================

; Sql default
:*:;sql.::
    PasteTemplateFromFile("sql")
    Send, {Up 2}{End}
return

; Sql to find a specified column
:*:;sqlcol::
    PasteTemplateFromFile("sqlcol")
    Send, {Up 1}{End}{Left 2}
return
