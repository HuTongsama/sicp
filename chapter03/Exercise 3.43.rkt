#lang sicp
;Double serializing the exchange procedure, using both
;accounts' serializers,protects the exchange operations
;from being interleaved with other account operations
;from either account. This makes exchange atomic. So
;its behavior will be as expected.
