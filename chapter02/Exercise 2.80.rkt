#lang sicp
(define (=zero? x) (apply-generic '=zero? x))
(define (install-scheme-number-package)
  ;...
  (put '=zero? '(scheme-number scheme-number) (lambda (x) (= x 0)))
  )
(define (install-rational-package)
  (put '=zero? '(rational rational) (lambda (x) (= (number x) 0))))
(define (install-complex-package)
  (put '=zero? '(complex complex) (lambda (x) (= (real-part x) (image-part x) 0))))
