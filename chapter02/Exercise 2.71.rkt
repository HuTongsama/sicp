#lang sicp
;           (a b c d e) 31
;                       /\
;          (a b c d) 15   (e) 16
;                    /\
;           (a b c) 7  (d) 8
;                  /\
;           (a b) 3  (c) 4
;                /\
;            (a) 1 (b) 2
;the tree above is for n = 5,for n = 10 is similar,only larger,
;in such a tree,only 1 bit is required to encode the most frequent
;symbol,(n-1) bits for the least frequent symbol.