#lang sicp
(define (square x)
  (* x x))
(define (goodEnough? oldguess newguess)
  (> 0.001
     (/ (abs (- oldguess newguess))
        oldguess)))

(define (improveGuess guess x)
  (/ (+ guess (/ x guess)) 2))

(define (square_iter guess x)
  (if (goodEnough? guess (improveGuess guess x))
      (improveGuess guess x)
      (square_iter (improveGuess guess x) x)))

(define (square_root x)
  (square_iter 1.0 x))

(square_root 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)
(square_root 0.00000001)


