#lang sicp
(define (union-set set1 set2) 
   (define (aux set1 set2) 
     (cond ((null? set2) set1) 
           ((null? set1) set2) 
           ((= (car set1) (car set2)) 
            (cons (car set1) (aux (cdr set1) (cdr set2)))) 
           ((< (car set1) (car set2)) (cons (car set1) (aux (cdr set1) set2))) 
           (else (cons (car set2) (aux set1 (cdr set2)))))) 
   (list->tree (aux (tree->list-2 set1) (tree->list-2 set2)))) 
  
(define (intersection-set set1 set2) 
   (define (aux set1 set2) 
         (cond ((or (null? set1) (null? set2)) '()) 
               ((= (car set1) (car set2)) 
                (cons (car set1) (aux (cdr set1) (cdr set2)))) 
               ((< (car set1) (car set2)) 
                (aux (cdr set1) set2)) 
               ((> (car set1) (car set2)) 
                (aux set1 (cdr set2))))) 
   (list->tree (aux (tree->list-2 set1) (tree->list-2 set2))))
