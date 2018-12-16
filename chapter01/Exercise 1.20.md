In applicative-order evaluation:
```
(gcd 206 40)  ;(gcd 40 (remainder 206 40))
(gcd 40 6)    ;(gcd 6 (remainder 40 6))
(gcd 6 4)     ;(gcd 4 (remainder 6 4))
(gcd 4 2)     ;(gcd 2 (remainder 4 2))
(gcd 2 0)     ;(gcd 0 (remainder 2 0))
```
In normal-order evaluation,the remainder operations
will performed when pass to subprocedure like this:
```
(gcd 40 (remainder 206 40)
	(if (= (remainder 206 40) 0))
	...)
```

So in applicative-order evaluation there will be 5
remainder operations,and normal-order will be a lot.