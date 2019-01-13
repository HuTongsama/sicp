#lang sicp
(define (cont-frac n d k)
  (define (next x)
    (if (> x k)
        (/ (n x) (d x))
        (/ (n x)
           (+ (d x) (next (+ x 1))))))
  (next 1))
(define (D k)
  (define (special-k? x)
    (if (= 0
           (remainder (+ x 1) 3))
        #t
        #f))
  (if (special-k? k)
      (* 2
         (/ (+ k 1) 3))
      1))
(define (approximate-e n)
  (+ 2
     (cont-frac (lambda (x) 1.0)
                D
                n)))
(approximate-e 10)