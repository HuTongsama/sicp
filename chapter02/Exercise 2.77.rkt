#lang sicp
; (magnitude z)
;->(apply-generic 'magnitude z)
;->(let ((type-tags '(complex))))
;->(let ((proc (get 'magnitude '(complex)))))
;->(apply magnitude (contents z))
;>(magnitude new-z) new-z is (contents z)
;->(apply-generic 'magnitude new-z)
;->(let ((type-tags '(rectangular))))change to a new tag and next is the same as above

;there seems to be two magnitude,but they are used in different barrier,they are different.