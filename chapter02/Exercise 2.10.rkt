#lang sicp
(define (div-iterval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "wrong interval")
      (mul-interval
       x
       (make-iterval (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y))))))