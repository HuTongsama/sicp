#lang sicp
(define (square x)
  (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                            answer))))
  (iter items nil))
(square-list (list 1 2 3 4))
#|
(iter (2 3 4) (cons (square 1) nil))
(iter (2 3 4) (1 '()))
...
(16 9 4 1)
|#
(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
(square-list1 (list 1 2 3 4))
#|
the new version conses a list to the squared
value,so it causes a bug.
|#