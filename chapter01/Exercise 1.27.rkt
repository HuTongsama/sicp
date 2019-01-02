#lang sicp
(define (square x)
  (* x x))
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
(define (carmichael-test n)
  (test-iter 1 n))
(define (test-iter a n)
  (cond ((= a n) #t)
        ((congruent? a n) (test-iter (+ a 1) n))
        (else #f)))
(define (congruent? a n)
  (= (expmod a n n) a))
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)