#lang racket
(define(carmichael carnum)
  (define (helper a n)
          (printf "~a \n~a\n ~a \n\n" a (fast-expt a n)(expmod a n n ))
          (if (= a n)
              "done"
              (helper (+ a 1) n)))
  (helper (- carnum 1) carnum))

(define (even? n)(= (remainder n 2) 0))

(define (square x)(* x x))

(define (fast-expt b n)
        (cond ((= n 0) 1)
              ((even? n) (square (fast-expt b (/ n 2))))
              (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m);g(f)
  (printf "~a ~a ~a \n" base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                        m))))

(carmichael 561)