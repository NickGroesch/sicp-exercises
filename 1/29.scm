#lang racket
;simpsons rule
(define (sum term a next b) (if (> a b)
                                0
                                (+ (term a)
                                   (sum term (next a) next b))))

(define (inc num) (+ num 1))

(define (simpsons f a b n)
     
(/ (* (sum (+ (f (+ a ((/ (- a b) n)) ))
              f2
              f3)
           1
           inc
           (/ n 2))
      (/ (- a b) n))
   3))