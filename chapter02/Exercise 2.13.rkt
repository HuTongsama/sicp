#lang sicp
#|
asume that i1 = (c1-c1*p1,c1+c1*p1),i2 = (c2-c2*p2,c2+c2*p2)
if all numbers are positive
i1*i2 = ((lower-bound i1)*(lower-bound i2),(upper-bound i1)*(upper-bound i2))
      =(c1c2 - c1c2p2 - c1c2p1 + c1c2p1p2, c1c2 + c1c2p2 + c1c2p1 + c1c2p1p2)
      = [(c1c2*(1 - (p1+p2) +p1*p2)),(c1c2*(1+ (p1+p2)+p1*p2))
p1*p2 is a very small number,so it can be ignored if tolerance is very small.
|#