#lang racket
;; left to righ 
(define (list-of-values1 exps env)
  (if (no-operand? exps)
      '()
      (let* ((left (eval (first-operand exps) env))
             (right (eval (rest-operands exps) env)))
        (cons left right)))) 
  
 ;; right to left 
(define (list-of-values2 exps env)
  (if (no-operand? exps)
      '()
      (let* ((left (eval (rest-operands exps) env))
             (right (eval (first-operand exps) env)))
        (cons left right)))) 