#lang sicp
(define (install-rational-package)
  ;other procedures omitted
  (define (make-rat n d)
    (if (and (integer? n) (integer? d))
        (cons (/ n (gcd n d)) (/ d (gcd n d)))
        (cons n d))))
