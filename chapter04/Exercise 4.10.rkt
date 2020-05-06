#lang racket
 (define (last-element lst) 
     (if (null? (cdr lst)) 
         (car lst) 
         (last-element (cdr lst)))) 
  
 (define (tagged-list? exp sym) 
     (if (pair? exp) 
         (let ((last (last-element exp))) 
             (eq? last sym)) 
         #f)) 
  