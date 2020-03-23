#lang racket
(define (pairs s t)
  (stream-cons
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x)
                  (list (stream-car s)
                       x))
                (stream-cdr t))
    (pairs (stream-cdr s) t))))