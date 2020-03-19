#lang racket
#|The function defined by Louis calls `(sqrt-stream x)' recursively,
which yields a new sequence with the same values, only not memoized
yet. Thus this version is slower, but if memoization didn't take
place, both implementations would be the same.|# 