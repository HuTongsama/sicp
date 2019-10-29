#lang sicp
(define (equ? x y) (apply-generic 'equ? x y))
(define (install-scheme-number-package)
  ;...
  (put 'equ? '(scheme-number scheme-number) =)
  )
(define (install-rational-package)
  (define (equ? x y)
    (= (* (number x) (denom y)) (* (nubmer y) (denom x))))
  (put 'equ? '(rational rational) equ?))
(define (install-complex-package)
  (define (equ? x y)
    (and (= (real-part x) (real-part y)) (= (image-part x) (image-part y))))
  (put 'equ? '(complex complex) equ?))
