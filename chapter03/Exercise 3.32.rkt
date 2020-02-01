#lang racket
;((lambda () (set-signal! output 0)) (lambda () (set-signal! output 1))) 
  
;If the execution order of the above action list changed, the final result of output will be different. 
