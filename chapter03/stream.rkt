#lang sicp
(define-syntax stream-cons
  (syntax-rules ()
    ((stream-cons head tail)
     (cons head (memo-proc (lambda () tail))))))
(define (memo-proc proc)
  (let ((already-run? #f)
        (result #f))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? #t)
                 result)
          result))))
;(define (cons-stream a b)
;  (cons a (memo-proc (lambda () b))))
(define (stream-car s)
  (car s))
(define (stream-cdr s)
  (force (cdr s)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
(define the-empty-stream '())
(define (stream-null? s)
  (if (null? s)
      #t
      #f))
(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))
(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter
                       pred
                       (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))
(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x) (newline) (display x))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define sum 0)
(define (accum x) (begin (set! sum (+ x sum))
                         sum))
(define (display-sum)
  (begin
    (display sum)
    (newline)))
(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
(display-sum)
(define y (stream-filter even? seq))
(display-sum)
(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))
(display-sum)
(stream-ref y 7)
(display-sum)
(display-stream z)
(display-sum)
;(define (integers-starting-from n)
;  (cons-stream n (integers-starting-from (+ n 1))))
;(define integers (integers-starting-from 1))
(define ones (cons-stream 1 ones))
(define integers
(cons-stream 1 (add-streams ones integers)))









