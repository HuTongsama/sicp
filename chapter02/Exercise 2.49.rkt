#lang sicp
(define (bottom-left frame) (origin-frame frame))
(define (top-left frame) (add-vect (bottom-left frame)
                                   (edge1-frame frame)))
(define (top-right frame) (add-vect (top-left frame)
                                    (edge2-frame frame)))
(define (bottom-right frame) (add-vect (bottom-left frame)
                                       (edge2-frame frame)))
;a
(define (frame-painter frame)
  (let ((left (make-segment (bottom-left frame) (top-left frame)))
        (top (make-segment (top-left frame) (top-right frame)))
        (right (make-segment (top-right frame) (bottom-right frame)))
        (bottom (make-segment (bottom-right frame) (bottom-left frame)))
        )
    (segments-painter (list left top right bottom))))
;b
(define (x-painter frame)
  (let ((line1 (make-segment (bottom-left frame) (top-right frame)))
        (line2 (make-segment (top-left frame) (bottom-right frame)))
        )
    (segments-painter (list line1 line2))))
;c,d pass