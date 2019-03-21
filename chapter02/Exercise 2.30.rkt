#lang sicp
(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))
(define (map-tree tree)
  (map (lambda (x)
         (if (pair? x)
             (map-tree x)
             (* x x)))
       tree))
(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
tree
(square-tree tree)
(map-tree tree)
