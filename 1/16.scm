#lang racket
(define (even? n)
(= (remainder n 2) 0))
(define (square x)(* x x))

(define (fast-expt b n)
        (cond ((= n 0) 1)
              ((even? n) (square (fast-expt b (/ n 2))))
              (else (* b (fast-expt b (- n 1))))));because fast-expt gets passed to * its not tail recursive
;make the above recursive algorithm iterative

(define (fastiter-exponent base ponent)
        (printf "original base ~a\n" base)
        (define (fi-pon b countdown accum)
                (printf "~a ~a ~a \n" countdown b accum)
                (cond ((= countdown 0) accum)
                      ((even? countdown)(fi-pon (square b) (/ countdown 2) accum));
                      (else (fi-pon b (- countdown 1)(* accum b))));
 ;each of those last two conditions' predicates express the invariance being held between the three terms accum, base, countdown(ponent) by the transitions between the parameters
          
)
(fi-pon base ponent 1))
(fastiter-exponent 3 3)
(fastiter-exponent 3 7)
(fastiter-exponent 3 8)
(fastiter-exponent 7 15)