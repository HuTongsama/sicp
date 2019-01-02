#lang racket
(define (prime? n)
  (= (smallest-divisor n) n))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square x)
  (* x x))
(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
  (if (prime? n)
       (report-prime n (- (current-inexact-milliseconds) start-time))
      #f))
(define (report-prime n elapsed-time)
  (display n)
  (display "***")
  (display elapsed-time)
  (newline))
(define (search-for-primes n counts)
  (cond ((= counts 0) (newline))
        ((timed-prime-test n)
         (search-for-primes (next-odd n) (- counts 1)))
        (else
         (search-for-primes (next-odd n) counts))))
(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))