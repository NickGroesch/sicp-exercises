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
(define (max2of3 d e f)(cond ((= d (minOf3 d e f))(list e f))
                             ((= e (minOf3 d e f))(list d f))
                             ((= f (minOf3 d e f))(list d e))))
(max2of3 5 12 13)
(max2of3 500 120 13)
(define (myfunc a b c) (apply sum-of-squares (max2of3 a b c)))
(myfunc 2 3 4)
(myfunc 4 5 12)