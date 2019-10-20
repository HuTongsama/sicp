#lang sicp
(define (look-up key set)
  (cond ((null? set) #f)
        ((= key (car set)) #t)
        ((> key (car set)) (look-up key (caddr set)))
        ((< key (car set) (look-up key (cadr set))))))
