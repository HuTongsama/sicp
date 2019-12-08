#lang sicp
(define (is-cycle-list? l)
  (let ((table '()))
    (define (loop lst)
      (if (not (pair? lst))
          #f
          (if (memq lst table)
              #t
              (begin (set! table (cons lst table))
                     (or (loop (car lst))
                         (loop (cdr lst)))))))
    (loop l)))
