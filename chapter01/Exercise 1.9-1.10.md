# Exercise 1.9
```
(define (+ a b)
	(if (= a 0) b (inc (+ (dec a) b))))
(define (+ a b)
	(if (= a 0) b (+ (dec a) (inc b))))
```
To evaluate (+ 4 5) with these two methods,we could get two 
different processes.
If we use the first procedure,we could expand our process like
this:
```
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```
While evaluating ,we could see the expanding  part and
shrinking part,and need some extra cost to track this
procedure,this is a linear recursive process.

If we use the second procedure,we could get something like
this:
```
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```
As showing above,all we need to track is current a and b,
this is a iterative process.
***
#Exercise 1.10
```
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
;1024
(A 1 10)
;65536
(A 2 4)
;65536
(A 3 3)
```
```
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
```
For the first procedure,it can be easily know that it's 
mathematical definition is 2*n.
For the second one,we can expand the procedure like this:
```
A(0 A(1 n-1))
A(0 A(0 A(1 n-2)))
...
A(0 A(0 A(0 ...A(1 1))))
```
With the definition of A,we can conclude that the mathematical
definition is 2^n.(2*2*2...*2)
For the last one,if we expand  the procedure similarly and get
something like:
```
A(1 A(1 A(1 ...A(1 A(2 1)))))
A(1 A(1 A(1 ...A(1 2))))
```
It's mathematical definition is evaluate n-1 times exponential 
operations like 2^(2^(2^(...2))).

























