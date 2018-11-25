# Exercise 1.4
```
(define (a-plus-abs-b) a b)
	((if (> b 0) + -) a b))
```

While b is greater than 0,operator + will be
the result of the conditional expression,so
that the value will be a+b.In other condition,
a-b will be the result.
***
# Exercise 1.5
```
(define (p) (p))
(define (test x y))
	(if (= x 0) 0 y))
(test 0 (p))
```
If the interpreter is using applicative-order 
evaluation it will evaluate each parameter at 
first,so when p is evaluated,the result will 
be infinite loop.
If the interpreter is using normal-order evaluation
,the parameter is evaluated only when it is needed,
in above condition,only 0 will be evaluated,so the
result will be 0.	 
***
# Exercise1.6
```
(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
			(else else-clause)))
```

If is provided as a special form,when it's predicate part
is true,then-clause is evaluated,otherwise else-clause is
evaluated,only one of them will be evaluated.
The new defined new-if is only a common procedure,according
to the rules of interpreter using applicative-order evaluation
,no matter the value of predicate is true or false,both then-
clause and else-clause will be evaluated,which will make sqrt-iter
execute infinitely.