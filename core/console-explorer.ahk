;--------------------------------------------
; https://markjacobsen.net
;--------------------------------------------

#HotIf WinActive("ahk_group CMD_PROMPT")

; Enable paste via ctrl+v
^V::{
    SendInput("{Raw}" A_Clipboard)
}

; Use "page up" key to scroll up
PgUp::{
    Send("{WheelUp}")
}

; Use "page down" key to scroll down
PgDn::{
    Send("{WheelDown}")
}

#HotIf ; Close CMD_PROMPT context


#HotIf WinActive("ahk_group FILE_EXPLORER")

; open current explorer folder in cmd prompt on CTRL+ALT+P
^!P::{
    Send("!d")
    Send("c:\windows\system32\cmd.exe .")
    Send("{enter}")
}

#HotIf ; Close FILE_EXPLORER context