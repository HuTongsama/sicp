#lang sicp
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
#|
expand (add-1 zero)
(lambda (f)
  (lambda (x)
    (f ((zero f) x))))
according to definition
((zero f) x)->x
so
(add-1 zero)
->
(lambda (f)
  (lambda (x)
    (f x)))
|#
(define one (lambda (f)
              (lambda (x)
                (f x))))
#|
through expanding (add-1 one),we could
get the definition of two
|#
(define two (lambda (f)
              (lambda (x)
                (f (f x)))))
(define (+ m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))
(define (f x) (* 2 x))
((zero f) 1)
((one f) 1)
((two f) 1)
(define three (+ one two))
(define five (+ three two))
((three f) 1)
((five f) 1)