#lang sicp
(car ''abracadabra)

;the interpreter explains (car '' abc) as (car (quote (quote abc))),
;the first 'quote' quotes the next statement (quote abc),which is a
;list with two elements,so caring this list yields 'quote'.