#lang sicp
;The (memo-fib) never computes the same result twice. the call tree is a linear list. 
;If define memo-fib to be (memorize fib), the procedure won't work. because fib calls itself to compute (fib n) before applies memorize.
