#lang racket
;the old first
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  ;(printf "~a ~a \n" n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))



(define (prime? n)
(= n (smallest-divisor n)))
;new given
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time)n)
      '()))

(define (report-prime elapsed-time number)
  (display " *** ")
  (display elapsed-time)
  (list number))
;sought
(define (primetest lowerlimit upperlimit primes)
        (if (or (>= lowerlimit upperlimit) (= 3 (length primes)))
            (printf "\n done")
            (primetest (+ 2 lowerlimit) upperlimit (append primes (timed-prime-test lowerlimit) ))))
(primetest 999 5001 '());.0035ms
(primetest 9999 50001 '());.009ms
(primetest 99999 500001 '());.027ms
(primetest 999999 5000001 '());.08ms
(primetest 9999999 50000001 '());.25ms per prime
(primetest 99999999 500000001 '());.74ms
(primetest 999999999 5000000001 '());~3ms
;every time we increase by 100x ms goes up by 10x that's the old n(Logn)