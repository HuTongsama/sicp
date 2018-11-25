# Exercise 1.4
`
(define (a-plus-abs-b) a b)
	((if (> b 0) + -) a b))
`	
While b is greater than 0,operator + will be
the result of the conditional expression,so
that the value will be a+b.In other condition,
a-b will be the result.
***
# Exercise 1.5
`
(define (p) (p))
(define (test x y))
	(if (= x 0) 0 y))

(test 0 (p))
`
If the interpreter is using applicative-order 
evaluation it will evaluate each parameter at 
first,so when p is evaluated,the result will 
be infinite loop.
If the interpreter is using normal-order evaluation
,the parameter is evaluated only when it is needed,
in above condition,only 0 will be evaluated,so the
result will be 0.	 