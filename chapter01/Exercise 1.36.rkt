#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
  (define (average x y)
    (/ (+ x y) 2))
  (define (try guess)
    (let ((next (average
                 guess
                 (f guess))))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (fixed-point-without-damping f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
  (define (average x y)
    (/ (+ x y) 2))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(fixed-point-without-damping (lambda (x) (/ (log 1000) (log x))) 2.0)