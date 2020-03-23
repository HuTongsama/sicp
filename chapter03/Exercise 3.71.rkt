#lang racket
(define (Ramanujan s) 
          (define (stream-cadr s) (stream-car (stream-cdr s))) 
          (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
          (let ((scar (stream-car s)) 
                    (scadr (stream-cadr s))) 
                 (if (= (sum-triple scar) (sum-triple scadr))  
                         (cons-stream (list (sum-triple scar) scar scadr) 
                                                  (Ramanujan (stream-cddr s))) 
                         (Ramanujan (stream-cdr s)))))
(define Ramanujan-numbers 
         (Ramanujan (weighted-pairs integers integers sum-triple)))