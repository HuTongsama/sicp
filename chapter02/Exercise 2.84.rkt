#lang sicp
;assume the tower is a structure which is a list
;of pair,the pair is consist of a number and type,
;while the number is bigger,the position of this
;type is taller
(define (insert-tower type tower)
  (let ((pos (car type)))
    (cond ((or (null? tower) (< pos (caar tower)))
           (cons type '()))
          ((= pos (caar tower))
           (cons type (rise-tower tower)))
          (else
           (cons (car tower) (insert-tower type (cdr tower)))))))
(define (rise-tower tower)
  (map (lambda (type)
         (cons (+ 1 (car type)) (cdr type))) tower))
(define (get-type-pos type tower)
  (cond ((null? tower) -1)
        ((eq? type (cdar tower)) (caar tower))
        (else (get-type-pos type (cdr tower)))))
(define type-tower (list (cons 1 'integer) (cons 2 'rational) (cons 3 'real) (cons 4 'complex)))
(define (apply-generic op . args)
  (let ((types-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((pos1 (get-type-pos type1))
                      (pos2 (get-type-pos type2)))
                  (cond ((or (= pos1 -1) (= pos2 -1) (= pos1 pos2)) (error "No method for these types" (list op type-tags)))
                        ((< pos1 pos2) (apply-generic op ((get 'rise type1) a1) a2))
                        (else (apply-generic op a1 ((get 'rise type2) a2)))))))
          (error "No method for these types" list op type-tags)))))