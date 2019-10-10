#lang sicp
(define (below1 painter1 painter2)
  (let ((paint-top
         (transform-painter
          painter1
          (make-vect 0.0 1.0)
          (make-vect 0.0 0.5)
          (make-vect 1.0 1.0)))
        (paint-bottom
         (transform-painter
          painter2
          (make-vect 0.0 0.0)
          (make-vect 0.0 0.5)
          (make-vect 0.0 1.0))))
    (lambda (frame)
      (paint-top frame)
      (paint-bottom frame))))
(define (below2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painters))))