#lang sicp
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))
(define (rotate180 painter)
  (rotate90 (rotate90 painter)))
(define (rotate270 painter)
  (rotate90 (rotate90 (rotate90 painter))))
