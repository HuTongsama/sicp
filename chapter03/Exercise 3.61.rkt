#lang racket
(define (invert-unit-series s)
  (define series
    (stream-cons
     1
     (scale-stream (mul-series series
                               (stream-cdr s)) -1)))
  series)