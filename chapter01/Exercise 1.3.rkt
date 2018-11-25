#lang sicp
(define (square x)
  (* x x))
(define (max x y)
  (if (> x y)
      x
      y))
(define (min x y)
  (if (> x y)
      y
      x))
(define (sum_of_squares x y z)
  (+ (square (max x y))
     (square (max z (min x y)))))

(sum_of_squares 1 2 3)
(sum_of_squares 4 2 3)
(sum_of_squares 5 6 2)