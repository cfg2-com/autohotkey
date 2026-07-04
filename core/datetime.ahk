;--------------------------------------------
; https://markjacobsen.net
;--------------------------------------------

:O:#dtopts::Text options where *=h (human), s (system), f (filesystem), c (code): dt* , dtd* , dtt*

; Date/Time ("human" format)
:O:.dth::
{
    CurrentDateTime := FormatTime(, "MM/dd/yyyy hh:mm tt")
    SendInput(CurrentDateTime)
}

; Date/Time ("system" format)
:O:.dts::
{
    CurrentDateTime := FormatTime(, "yyyy-MM-dd HH:mm")
    SendInput(CurrentDateTime)
}

; Date/Time ("filesystem" format)
:O:.dtf::
{
    CurrentDate := FormatTime(, "yyyy-MM-dd_HH-mm")
    SendInput(CurrentDate)
}

; Date/Time ("code" format)
:O:.dtc::
{
    CurrentDateTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    SendInput(CurrentDateTime)
}

;---------------------------------------------------------------------

; Date ("human" format)
:O:.dtdh::
{
    CurrentDate := FormatTime(, "MM/dd/yyyy")
    SendInput(CurrentDate)
}

; Date ("system" format)
:O:.dtds::
{
    CurrentDate := FormatTime(, "yyyy-MM-dd")
    SendInput(CurrentDate)
}

; Date ("filesystem" format)
:O:.dtdf::
{
    CurrentDate := FormatTime(, "yyyy-MM-dd")
    SendInput(CurrentDate)
}

; Date ("code" format)
:O:.dtdc::
{
    CurrentDate := FormatTime(, "yyyy-MM-dd")
    SendInput(CurrentDate)
}

;---------------------------------------------------------------------

; Time ("human" format)
:O:.dtth::
{
    CurrentDateTime := FormatTime(, "hh:mm tt")
    SendInput(CurrentDateTime)
}

; Time ("system" format)
:O:.dtts::
{
    CurrentDateTime := FormatTime(, "HH:mm")
    SendInput(CurrentDateTime)
}

; Time ("filesystem" format)
:O:.dttf::
{
    CurrentDateTime := FormatTime(, "HH:mm")
    SendInput(CurrentDateTime)
}

; Time ("code" format)
:O:.dttc::
{
    CurrentDateTime := FormatTime(, "HH:mm:ss")
    SendInput(CurrentDateTime)
}

;---------------------------------------------------------------------