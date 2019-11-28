#lang sicp
(define f
  (let ((init 1))
    (lambda (x)
      (begin (set! init (* x init))
             init))))
