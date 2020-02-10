#lang sicp
;If delay were not memoized, then the lookup part of the previous two
;elements would be replaced by a full computation, since every element
;in a stream besides the very first one is delayed and must be forced
;every time it is accessed. 
