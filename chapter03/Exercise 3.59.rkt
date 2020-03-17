#lang sicp
;a
(define (integrate-series s)
  (stream-map * (stream-map / ones integers) s))
;b
(define cosine-series (stream-cons 1 (integrate-series sine-series)))
(define sine-series (stream-cons 0 (scale-stream (integrate-series cosine-series) -1)))
