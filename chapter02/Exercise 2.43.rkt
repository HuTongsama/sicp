#lang sicp
#|
procedure queen-cols will be re-evaluated for every item in (enumerate-interval 1 board-size).
Therefore the whole work has to be duplicated board-size times at every recursion level.
Since there are always board-size recursions this means that the whole work will be duplicated
bord-size^board-size times. 
|#
