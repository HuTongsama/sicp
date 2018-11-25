#lang sicp
(define (square x)
  (* x x))
(define (good-enough? oldguess newguess)
  (> 0.001
     (/ (abs (- oldguess newguess))
        oldguess)))
(define (improve guess x)
  (/
   (+ (/ x (square guess))
    (* 2 guess))
   3))

(define (cube-iter guess x)
  (if(good-enough? guess (improve guess x))
     (improve guess x)
     (cube-iter (improve guess x) x)))

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 1)
(cube-root 2)
(cube-root 3)
(cube-root 8)
(cube-root 27)
(cube-root 0.0000000027)
(cube-root 8000000000000000000000000000000000000000000000000)
