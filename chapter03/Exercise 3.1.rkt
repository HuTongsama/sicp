#lang sicp
(define (make-accumulator initial-value)
  (lambda (x)
    (begin (set! initial-value (+ initial-value x))
           initial-value)))
(define A (make-accumulator 5))
(A 10)
(A 10)