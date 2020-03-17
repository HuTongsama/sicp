#lang sicp
(define (partial-sum s)
  (define ps (add-streams s (stream-cons 0 ps)))
  ps)
