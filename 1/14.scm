#lang racket

(define (count-change amount) (cc 0 amount 5))

(define (cc cccalls amount kinds-of-coins)
        (printf "~a ~a ~a\n" cccalls amount kinds-of-coins ); cccalls is really only tracking branching depths, nota true enumeration of branches (much less leaves)
        (cond ((= amount 0) 1)
              ((or (< amount 0) (= kinds-of-coins 0)) 0)
              (else (+ (cc (+ cccalls 1) amount (- kinds-of-coins 1))
                       (cc (+ cccalls 1) (- amount(first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
         (cond ((= kinds-of-coins 1) 1)
               ((= kinds-of-coins 2) 5)
               ((= kinds-of-coins 3) 10)
               ((= kinds-of-coins 4) 25)
               ((= kinds-of-coins 5) 50)))

(count-change 11)