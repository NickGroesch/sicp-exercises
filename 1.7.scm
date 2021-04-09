#lang racket
;TODO change this for good-enough detecting small fraction of guess.
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))

(define (good-enough? guess x)
 ; (< (abs (- (square guess) x)) 0.001))
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x) (average guess (/ x guess)))
(define (sqrt-iter guess x)
    (printf "~a \n" guess)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt 1001)
;the original good enouth fails for small numbers because they never get small enough before the .001 error margin
;FAILS by saying good-enough TOO FAST
(print "small num tests\n")
(sqrt 0.0001)
(sqrt 0.0000001)
(sqrt 0.00000000000000000000000001)

;it fails for big numbers because it will lose precision
(print "big num tests\n")
(sqrt 1000000)
(sqrt 10000000000)
(sqrt 100000000000000)
(sqrt 10000000000000000000000)
;(sqrt 1e+58), spins out on 1.00..0001e29, not enought zeos left to get there
;bam, here it is, stack overflow because we lose the precision for our guess to ever be good enough
;FAILS by ANSWERING TOO SLOW (never)


;trying to add another watch variable
(define (sqrtImproved goal)
(define (good-enough?2 guess last goal)
  (printf "~a ~a ~a\n" guess last  (abs (- guess last)))
  (<= (abs (- guess last)) (/ guess 100)))
  ; (< (abs (- (square guess) goal)) (* 0.001 ))
(define (improve2 guess goal) (average guess (/ goal guess)))
(define (sqrt-iter2 guess last goal)
    (printf "~a ~a ~a\n" guess last goal)
    (if (good-enough?2 guess last goal)
        guess
        (sqrt-iter2 (improve2 guess goal) guess goal)))
  (sqrt-iter2 1.0 0.1 goal))

 (sqrtImproved 25)
(print "small num tests\n")
(sqrtImproved 0.0001)
(sqrtImproved 0.0000001)
(sqrtImproved 0.00000000000000000000000001)
;better!
(print "big num tests\n")
(sqrtImproved 1e+58);bottomed out this time
(sqrtImproved 1e+100)