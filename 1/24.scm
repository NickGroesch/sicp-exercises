#lang racket
(define (smallest-divisor n) (find-divisor n 2))

(define (next-divisor x)(if(= x 2) 3 (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else(remainder (* base (expmod base (- exp 1) m))
                        m))))


(define (fermat-test n) (define (try-it a)
(= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times) (cond ((= times 0) true)
((fermat-test n) (fast-prime? n (- times 1))) (else false)))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

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

(fermtest 1000000021)

(primetest 999 5001 '());.0035ms
(primetest 9999 50001 '());.009ms
(primetest 99999 500001 '());.027ms
(primetest 999999 5000001 '());.08ms
(primetest 9999999 50000001 '());.25ms per prime
(primetest 99999999 500000001 '());.74ms
(primetest 999999999 5000000001 '());~3ms

;this is definitely exponentially more effectient! now the timing is approximately .025 ms more than the number of digits we are checking