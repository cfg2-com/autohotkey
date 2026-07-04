;--------------------------------------------
; https://markjacobsen.net
; Misc web ehancements
;--------------------------------------------

;################################################################
; KEY REMAPPING SECTION
; ALT+[key]
;################################################################
!G::GoogleIt()
!U::GoToUrl()


;################################################################
; TEXT EXPANSION SECTION
;################################################################

; Given a FedEx tracking number on the clipboard, type .fedex to get the full tracking url
:O:.fedex::{
    SendInput("https://www.fedex.com/apps/fedextrack/?action=track&trackingnumber=" A_Clipboard "&cntry_code=us&locale=en_US")
}

; Given a UPS tracking number on the clipboard, type .ups to get the full tracking url
:O:.ups::{
    SendInput("https://www.ups.com/track?loc=en_US&tracknum=" A_Clipboard "&requester=WT/trackdetails")
}


;################################################################
; FUNCTIONS SECTION
;################################################################

GoogleIt() {
    ; InputBox(DefaultText, Title, Options)
    ib := InputBox("Google it...", "Search Google", "w400 h140 t60", A_Clipboard)
    
    if (ib.Result == "OK") {
        if (InStr(ib.Value, "http") == 1) {
            Run(ib.Value)
        } else {
            Run("https://www.google.com/search?q=" . ib.Value)
        }
    }
}

GoToUrl() {
    ib := InputBox("URL", "Go to URL", "w400 h140 t60", A_Clipboard)
    
    if (ib.Result == "OK") {
        userInput := ib.Value
        if (InStr(userInput, "http") <= 0) {
            userInput := "http://" . userInput
        }
        Run(userInput)
    }
}