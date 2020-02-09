#lang sicp
(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (exchanger (if (< (account1 'id) (account2 'id))
                       (serializer2 (serializer1 exchange))
                       (serializer1 (serializer2 exchange)))))
    (exchanger account1 account2)))