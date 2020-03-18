#lang racket
(define (div-series s1 s2)
    (cond ((eq? 0 (stream-car s2))
           (error "constant term of s2 can't be 0!"))
          (else (mul-series s1 (invert-unit-series s2)))))

(define tan-series (div-series sine-series cosine-series))