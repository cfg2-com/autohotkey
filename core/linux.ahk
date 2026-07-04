;--------------------------------------------
; https://markjacobsen.net
;--------------------------------------------

:O:#lopts::{#}options: lrm , llargeall , llargedirs , llargefiles
:O:.lrm::rm -rf [thing]
:O:.llargeall::du -a [dir] | sort -n -r | head -n 20
:O:.llargedirs::du [dir] | sort -n -r | head -n 20
:O:.llargefiles::find [dir] -type f -printf '%s %p\n' | sort -nr | head -20