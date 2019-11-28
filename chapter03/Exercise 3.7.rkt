#lang sicp
(define (make-joint origin-accout origin-password new-password)
  (lambda (password msg)
    (cond ((not (eq? password new-password)) error "wrong password")
          (else (origin-account origin-password msg)))))
