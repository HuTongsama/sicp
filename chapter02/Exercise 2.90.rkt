#lang sicp
(define (install-polynomial-dense-package)
 ;define adjoin-term and first-term for dense
  (define (tag x)
    (attach-tag 'polynomial-dense x))
  (put 'adjoin-term 'polynomial-dense
       (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'first-term 'polynomial-dense
       (lambda (term-list) (tag (first-term term-list))))
  )
(define (install-polynomial-sparse-package)
 ;define adjoin-term and first-term for sparse
  (define (tag x)
    (attach-tag 'polynomial-sparse x))
  (put 'adjoin-term 'polynomial-sparse
       (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'first-term 'polynomial-sparse
       (lambda (term-list) (tag (first-term term-list))))
  )
;other procedures are repeated
;polynomial-package
(define (make-poly variable term-list)
  (if (poly-sparse? term-list)
      ((get 'make-poly 'polynomial-sparse) term-list)
      ((get 'make-poly 'polynomial-dense) term-list)))
(define (poly-sparse? term-list) 
   (define (iter zeros remaining) 
     (cond ((null? remaining) 
            zeros) 
           ((equ? (coeff (car remaining)) 0) 
            (iter (+ zeros 1) (cdr remaining))) 
           (else 
            (iter zeros (cdr remaining))))) 
   (> (iter 0 term-list) 
      (/ (length term-list) 2))) 