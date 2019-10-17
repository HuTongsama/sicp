#lang sicp
(define (augend x)
  (if (null? (cdddr x))
      (caddr x)
      ((cons '+ (cddr x)))))
(define (multiplicand x)
  (if (null? (cdddr x))
      (caddr x)
      ((cons '* (cddr x)))))