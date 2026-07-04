;--------------------------------------------
; https://markjacobsen.net
; Main driver script that includes all the 
; common scripts desired as well as any
; machine/workstation specific commands.
;
; This is the main script that should be 
; run/active on your workstation.
;--------------------------------------------

#Requires AutoHotkey v2.0+

; #Warn All, MsgBox  ; Enable warnings to assist with detecting common errors.
SendMode("Input")    ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Environment Variables that could be used for dynamic processing
g_sComputerName := EnvGet("COMPUTERNAME")
g_sDomain       := EnvGet("USERDOMAIN")

; Groups need to be established in the main script
GroupAdd("CHROME_BROWSER", "ahk_class Chrome_WindowImpl_0")
GroupAdd("CHROME_BROWSER", "ahk_class Chrome_WidgetWin_1")
GroupAdd("CHROME_BROWSER", "ahk_class Chrome_WidgetWin_0")
GroupAdd("GroupAdd", "CHROME_BROWSER", "ahk_exe chrome.exe")

GroupAdd("CMD_PROMPT", "ahk_class ConsoleWindowClass")

GroupAdd("FILE_EXPLORER", "ahk_class CabinetWClass")
GroupAdd("FILE_EXPLORER", "ahk_class ExploreWClass")

GroupAdd("MS_OUTLOOK", "ahk_class rctrl_renwnd32")

; General purpose commands/scripts
; Feel free to comment out a particular script if you don't want to use it
#Include "core\emoji.ahk"
#Include "core\datetime.ahk"
#Include "core\media.ahk"
#Include "core\web.ahk"
#Include "core\chrome.ahk"
#Include "core\console-explorer.ahk"
#Include "core\git.ahk"
#Include "core\db.ahk"
#Include "core\docker.ahk"
#Include "core\linux.ahk"
#Include "core\workstation.ahk"

#Include "*i private\main.ahk"