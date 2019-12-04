#lang sicp
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define a (cons 'a 'b))
(define b (cons 'a 'b))
(define list-test (cons a b))
;
(count-pairs list-test)
(set-cdr! a b)
(count-pairs list-test)
(set-car! a b)
(set-cdr! list-test a)
(count-pairs list-test)
;infinite loop
;(set-cdr! b a)
;(count-pairs list-test)