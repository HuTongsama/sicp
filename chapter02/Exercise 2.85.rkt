#lang sicp
;complex package
(put 'project 'complex (lambda (x)
                         (attach-tag 'real (make-real (real-part x)))))
;real package
;assume procedure num1 and num2 can get something from a real number
;,and use these numbers could make a rational number
(put 'project 'real (lambda (x)
                      (attach-tag 'rational (make-rational (num1 x) (num2 x)))))
;rational package
(put 'project 'rational (lambda (x)
                          (attach-tag 'integer (quotient (numer x) (denom x)))))
;integer package
(put 'project 'integer (lambda (x)
                         '()))
(define (drop x)
  (define (can-be-dropped? x)
    (let ((projected-num ((get 'project (type-tag x)) (contents x))))
      (if (not (null? projected-num))
          (let ((rised-num ((get 'rise (type-tag projected-num) (contents projected-num)))))
            (if ((get 'equ (type-tag x)) rised-num projected-num)
                #t
                #f))
          #f)))
  (if (can-be dropped? x)
      (drop ((get 'project (type-tag x)) (contents x)))
      x))
;if we use drop in apply-generic,when two types are different
;when can first to try to drop the higner type,if failed,then
;we continue to rise the lower type