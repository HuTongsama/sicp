#lang racket
(require "deriv.rkt")

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(** (+ (* 2 x) y) 2) 'x)

