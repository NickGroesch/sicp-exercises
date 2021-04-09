#lang racket
(define (A x y) (cond ((= y 0) 0)
((= x 0) (* 2 y))
((= y 1) 2)
(else (A (- x 1) (A x (- y 1))))))
(A 0 10)
(A 0 8)
(A 0 5)
(printf "when x is 0 we doubling y")

 (A 1 10)
(A 1 9)
(A 1 1)
(printf "when x is 1 we are giving back 2 to the y \n")
;(A 2 5) ; this number is astronomical, thousands of digits long
 (A 2 4)
 (A 2 3)
 (A 2 2)
(A 2 1)
(A 2 0)
(printf "when x is 2 we are wtfn\n")
 (A 3 3)
(A 3 2)
(A 3 1)

;(define (h n) TO BE
;(A 2 n)
;(A (1) (A 2 (- n 1)))
;(A (1) (A (A (1) (A 2 (n - 2))) (n-1))) some crazy non-primitive recursive stuff that is a bit over my head right now 
 (* 16 16 16 16)