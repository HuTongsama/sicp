#lang racket
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
  ((cdr s)))
(define (sub-stream s n)
  (if (> n 0)
      (stream-cons (stream-car s) (sub-stream (stream-cdr s) (- n 1)))
      '()))
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
(define the-empty-stream '())
(define (stream-null? s)
  (if (null? s)
      #t
      #f))
(define (stream-map proc . stream-list)
  (if (stream-null? (car stream-list))
      the-empty-stream
      (stream-cons (apply proc (map stream-car stream-list))
                   (apply stream-map
                          (cons proc (map stream-cdr stream-list))))))
(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (stream-cons (stream-car stream)
                      (stream-filter
                       pred
                       (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))
(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x) (newline) (display x))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define (mul-streams s1 s2) (stream-map * s1 s2))
(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor))
              stream))

(define sum 0)
(define (accum x) (begin (set! sum (+ x sum))
                         sum))
(define (display-sum)
  (begin
    (display sum)
    (newline)))
#|(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))|#
;(stream-ref y 7)
;(display-stream z)
(define ones (stream-cons 1 ones))
(define integers
  (stream-cons 1 (add-streams ones integers)))


;(define factorials
;  (stream-cons 1 (mul-streams integers factorials)))
;(stream-ref factorials 10)
;(define (partial-sum s)
;  (define ps (add-streams s (stream-cons 0 ps)))
;  ps)
;(define test-stream (partial-sum integers))
;(stream-ref test-stream 10000)
;(define fibs
;  (stream-cons
;   0
;   (stream-cons 1 (add-streams (stream-cdr fibs) fibs))))

(define (integrate-series s)
  (mul-streams s
               (stream-map / ones integers)))

(define cosine-series (stream-cons 1 (integrate-series sine-series)))
(define sine-series (stream-cons 0 (scale-stream (integrate-series cosine-series) -1)))

(define (x-series x)
  (define series
    (stream-map (lambda (e)
                  (expt x e))
                integers))
  series)
(define (fx x s)
  (mul-streams x (stream-cdr s)))

(define (mul-series s1 s2)
  (stream-cons (* (stream-car s1) (stream-car s2))
               (add-streams (scale-stream (stream-cdr s2) (stream-car s1)) 
                                        (mul-series (stream-cdr s1) s2))))


(define circle-series 
     (add-streams (mul-series cosine-series cosine-series) 
                  (mul-series sine-series sine-series)))

;(display-stream (sub-stream circle-series 30))


(define (invert-unit-series s)
  (define series
    (stream-cons
     1
     (scale-stream (mul-series series
                               (stream-cdr s)) -1)))
  series)









