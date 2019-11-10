#lang sicp
(define (negate x) (apply-generic 'negate x))
;scheme-number package
(put 'negate 'scheme-number
     (lambda (x) (tag (- x))))
;rational package
(put 'negate 'rational
     (lambda (x)
       (make-rational (- (numer x)) (denom rat))))
;complex package
(put 'negate 'complex
     (lambda (x)
       (make-from-real-imag (- (real-part x))
                            (- (imag-part x)))))
;polynomial package
(define (negate-terms termlist)
  (if (empty-termlist? termlist)
      the-empty-termlist
      (let ((term (first-term termlist)))
        (adjoin-term (make-term (order term) (negate (coeff term)))
                     (negate-terms (rest-terms termlist))))))
(put 'negate 'polynomial
     (lambda (x)
       (make-polynomial (variable x)
                        (negate-terms (term-list x)))))
(put 'sub '(polynomial polynomial)
     (lambda (x y) (tag (add-poly x (negate y)))))
