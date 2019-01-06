#lang sicp
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (term a)
       (accumulate combiner null-value term (next a) next b))))
(define (accum-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (combiner (term a)
                  (accum-iter combiner null-value term (next a) next b))))
  (iter a null-value))
(define (sum term a next b)
  (accumulate
   (lambda (x y) (+ x y))
   0 term a next b))
(define (product term a next b)
  (accumulate
   (lambda (x y) (* x y))
   1 term a next b))
(define (sum-iter term a next b)
  (accum-iter
   (lambda (x y) (+ x y))
   0 term a next b))
(define (product-iter term a next b)
  (accum-iter
   (lambda (x y) (* x y))
   1 term a next b))
(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)
(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)
(sum-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)
(product-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)