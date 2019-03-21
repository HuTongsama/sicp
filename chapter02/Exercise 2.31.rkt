#lang sicp
(define (tree-map proc tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))
(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))
(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
(square-tree tree)
