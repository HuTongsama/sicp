#lang sicp
(define (pascal row col)
  (if (or (= col 1) (= row col))
      1
      (+ (pascal (dec row) col)
         (pascal (dec row) (dec col)))))
(pascal 3 2)
(pascal 4 2)
(pascal 4 3)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)