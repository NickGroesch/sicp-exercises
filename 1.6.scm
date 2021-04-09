#lang racket
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))

(define (good-enough? guess x) (< (abs (- (square guess) x))
0.001))

(define (sqrt x)
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x) (average guess (/ x guess)))
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt 1001)

;;new-if seems to spin out. because the function is going to be defined in terms of itself

;;Applicative order (evaluate all arguments and apply)
;;Normal Order (expand all expressions, then reduce)
;;Sepecial order for conditionals that doesn't need to evaluate the then unless its if turns out truthy