#lang racket
; this is just recursive not fast
(define (times a b)
  (printf "~a ~a \n" a b)
  (if (= b 0)
      0
      (+ a (times a (- b 1)))))
; nice helpers
(define (double int)(* 2 int))
(define (halve int)(/ int 2))

(define (even? n)
(= (remainder n 2) 0))

;ex 17 recursive is good enough
(define (fastTimes a b)
  (printf "~a ~a \n" a b)
       ; (define (fthelper a b )
                (cond ((= b 1) a)
                      ((even? b) (fastTimes (double a) (halve b)))
                      (else (+ a (fastTimes a (- b 1)))))) ;here the stack acts as an accumulator, which keeps around the old values of a as hidden state
; )

;ex 18 now make it iterative
(define (slimfastTimes f g)
        (define (fthelper a b accum)
           (printf "~a ~a ~a \n" a b accum)
                (cond ((= b 0)  accum)
                      ((even? b) (fthelper (double a) (halve b)  accum))
                      (else  (fthelper a (- b 1) (+ accum a)))))
        (fthelper f g 0)
)


;;;; testing with an example specially formulated example 
(times 2 17)
(fastTimes 2 17)
(slimfastTimes 2 17)

(times 3 25)
(fastTimes 3 25)
(slimfastTimes 3 25)