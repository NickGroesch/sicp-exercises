#lang racket
;prima facie looks like she could be right, if it is a function composition
(define (fast-expt b n);f
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmoded base exp m) (printf "~a ~a ~a \n" base exp m)(remainder (fast-expt base exp) m));g

;compared to
(define (square x) (* x x ))

(define (expmod base exp m);g(f)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else(remainder (* base (expmod base (- exp 1) m))
                        m))))

;let's use the substitution method to see if we can apply

;(define (expmoded base exp m)
 ;       (remainder ((cond ((= exp 0) 1)
  ;                         ((even? exp) (square (fast-expt base (/ exp 2))))
   ;                        (else (* base (fast-expt base (- exp 1)))))) m))

(time (expmod 17 19 123456789))
(time (expmoded 17 19 123456789))



(define (divides? a b) (= (remainder b a) 0))



(define (fermtest n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 25)
      (report-prime (- (current-inexact-milliseconds) start-time)n)
      '()))

(define (report-prime elapsed-time number)
  (display " *** ")
  (display elapsed-time)
  (list number))

(define (primetest lowerlimit upperlimit primes)
        (if (or (>= lowerlimit upperlimit) (= 3 (length primes)))
            (printf "\n done") 
            (primetest (+ 2 lowerlimit) upperlimit (append primes (fermtest lowerlimit) ))))

(define (fermat-test n) (define (try-it a)
(= (expmoded a n n) a))
(try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times) (cond ((= times 0) true)
((fermat-test n) (fast-prime? n (- times 1))) (else false)))

(fermtest 1000000021);she may be right about correctness, but it is not more effecient since it spins out pretty quickly

;(primetest 999 5001 '());.0035ms -- now 21 ms
;(primetest 9999 50001 '());.009ms --- 188ms
;(primetest 99999 500001 '());.027ms  --- at this stage I can watch how slow this works.
;(primetest 999999 5000001 '());.08ms
;(primetest 9999999 50000001 '());.25ms per prime
;(primetest 99999999 500000001 '());.74ms
;(primetest 999999999 5000000001 '());~3ms

;It looks like she is holding giant numbers in memory, which really slows down the test, rather than the more efficent modulo testing that never has to evaluate as big of numbers