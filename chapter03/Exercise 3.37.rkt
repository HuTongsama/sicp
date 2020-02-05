#lang sicp
(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))
(define (c- x y)
  (c+ x (- 0 y)))
(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))
(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x))
  z)
(define (cv x)
  (let ((z (make-connector)))
    (constant x z))
  z)