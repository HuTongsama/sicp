#lang sicp
(define (deep-reverse items)
  (cond ((null? items) items)
        ((pair? items)
         (if (null? (cdr items))
             (deep-reverse (car items))
             (list (deep-reverse (cdr items))
                   (deep-reverse (car items)))))
        (else items)))
(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)