#lang sicp
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))
(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (fast-mul (double a) (halve b)))
        ((odd? b) (+ a (fast-mul a (- b 1))))))

(fast-mul 1 2)
(fast-mul 2 3)
(fast-mul 5 6)
(fast-mul 256 125)
