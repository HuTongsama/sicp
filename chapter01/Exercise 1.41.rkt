#lang sicp
(define (double func)
  (lambda (x) (func (func x))))
(((double (double double)) inc) 5)
