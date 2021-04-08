#lang racket
;Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
;first some helpers from the textbook
(define (square x) (* x x))
(square 13)
(define (sum-of-squares x y) (+ (square x) (square y)))
(sum-of-squares 5 12)
(define (min a b)( if (< a b) a b))
(min 6 1006)
(define (minOf3 a b c)(min a (min b c)))
(minOf3 5 12 13)
;(define (myfunc a b c) ())