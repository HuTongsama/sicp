#lang sicp
;a
(define (integrate-series s)
  (stream-map * (stream-map / ones integers) s))
;b pass
