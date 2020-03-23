#lang racket
;Louis' implementation will recurse infinitely
;because their is no delay in (pairs (stream-cdr s)
;(stream-cdr t)), it will be called recursively.