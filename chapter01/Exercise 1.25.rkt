#lang racket
(define (fast-expt base exp)
  (expt-iter base exp 1))
(define (expt-iter base exp n)
  (cond ((= exp 0) n)
        ((even? exp) (expt-iter (square base) (/ exp 2) n))
        (else (expt-iter base (- exp 1) (* n base)))))
(define (square x)
  (* x x))
(define (Alyssa-expmod base exp m)
  (remainder (fast-expt base exp) m))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(expmod 100000000 10000000 3)
;correct but consume a lot time when evaluate
;big number and maybe cause overflow
(Alyssa-expmod 100000000 10000000 3)