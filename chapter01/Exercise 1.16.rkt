#lang sicp
(define (expt-iterative b n)
  (iter b n 1))
(define (iter b n a)
  (cond ((= n 0) a)
        ((even? n) (iter (* b b)
                         (/ n 2)
                         a))
        ((odd? n) (iter b
                        (- n 1)
                        (* a b)))))
(expt-iterative 2 10)
(expt-iterative 5 3)
