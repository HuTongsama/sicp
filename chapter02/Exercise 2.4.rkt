#lang sicp
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (a b) a)))
(define (cdr z)
  (z (lambda (a b) b)))
(define pair (cons 1 2))
(car pair)
(cdr pair)
#|
(car (cons 1 2)) 
(car (lambda (m) (m 1 2))) expand cons

((lambda (m) (m 1 2))
 (lambda (a b) a)) expand car

((lambda (a b) a)
 1 2) result
|#