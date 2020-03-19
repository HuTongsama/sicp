#lang racket
(define (ln2-summands n)
  (stream-cons (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))
(define ln2-stream
  (partial-sum (ln2-summands 1)))