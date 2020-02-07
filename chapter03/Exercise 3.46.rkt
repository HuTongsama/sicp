#lang sicp
;if test-and-set! has not been made atomic using without-interrupts
;A calls test-and-set!,(car cell) is false
;Before A's test-and-set! is completed,B calls test-and-set!
;,and the (car cell) is still false
;A sets (car cell) to true,B sets (car cell) to true
;So both A and B have acquired the mutex,which is bad.
