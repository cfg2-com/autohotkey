;--------------------------------------------
; https://markjacobsen.net
; Common media related hotkeys
;
; CTL+ALT+SHIFT+[key]
;
; To get the full benefit, you must have 
; NirCmd.exe in your C:\Windows directory
; or in the same directory as the AHK exe
; https://www.nirsoft.net/utils/nircmd.html
;--------------------------------------------

; Play/pause toggle
^!+P::Send("{Media_Play_Pause}")

; Volume Mute/unmute toggle
^!+V::Run("nircmd.exe mutesysvolume 2")

; Mic Mute/unmute toggle
^!+M::Run("nircmd.exe mutesysvolume 2 microphone")

; Volume up/down
^!+Up::Send("{Volume_Up}")
^!+WheelUp::Send("{Volume_Up}")
^!+Down::Send("{Volume_Down}")
^!+WheelDown::Send("{Volume_Down}")

; Next/prev
^!+Right::Send("{Media_Next}")
^!+Left::Send("{Media_Prev}")