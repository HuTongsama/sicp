#lang sicp
(define (same-parity . list)
  (define (func filter sublist)
    (cond ((null? sublist) sublist)
          ((filter (car sublist))
           (cons (car sublist)
                 (func filter (cdr sublist))))
          (else (func filter (cdr sublist)))))
  (cond ((null? list) list)
        ((even? (car list))
         (cons (car list) (func even? (cdr list))))
        (else
         (cons (car list) (func odd? (cdr list))))))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)