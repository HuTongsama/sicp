#lang sicp
(define (zero-poly? p)
  (empty-termlist? (term-list p)))
;add in polynomial package
(put '=zero? 'polynomial zero-poly?)
