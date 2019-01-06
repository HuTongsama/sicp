#lang sicp
(define (filtered-accumulate combiner null-value term a next b valid?)
  (if (> a b)
      null-value
      (let ((next-result
             (filtered-accumulate
              combiner null-value term (next a) next b valid?)))
        (if (valid? a)
            (combiner (term a) next-result)
            next-result))))
(define (prime? n)
  (= (smallest-divisor n) n))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square x)
  (* x x))
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


(define (primes-sum a b)
  (filtered-accumulate
   (lambda (x y) (+ x y))
   0
   (lambda (x) x)
   a
   (lambda (x) (+ x 1))
   b
   prime?))

(define (relative-prime? x n)
  (and (< x n)
       (= 1 (gcd x n))))
(define (product-relative-prime n)
  (filtered-accumulate
   (lambda (x y) (* x y))
   1
   (lambda (x) x)
   1
   (lambda (x) (+ x 1))
   n
   (lambda (x) (relative-prime? x n))))
(primes-sum 1 10)
(primes-sum 1 100)
(product-relative-prime 10)