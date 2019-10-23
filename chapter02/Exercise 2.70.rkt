#lang sicp
(define tree-generated '((leaf NA 16)
                         ((leaf YIP 9)
                          (((leaf A 2)
                            ((leaf WAH 1)
                             (leaf BOOM 1)
                             (WAH BOOM) 2)
                            (A WAH BOOM) 4)
                           ((leaf SHA 3)
                            ((leaf JOB 2)
                             (leaf GET 2)
                             (JOB GET) 4)
                            (SHA JOB GET) 7)
                           (A WAH BOOM SHA JOB GET) 11)
                          (YIP A WAH BOOM SHA JOB GET) 20)
                         (NA YIP A WAH BOOM SHA JOB GET) 36))
(define message '(GET A JOB
                  SHA NA NA NA NA NA NA NA NA
                  GET A JOB
                  SHA NA NA NA NA NA NA NA NA
                  WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                  SHA BOOM))
(define bits-encoded '(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0
  1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1))
(length bits-encoded)
;if we use a fixed-length code to encode the eight-symbol alphabet
;,each alphabet needs 3 bits to encode (2^3 = 8),so we need 264 bits (3 * 36 = 108) to encode.