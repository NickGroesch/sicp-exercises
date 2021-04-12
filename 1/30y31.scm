#lang racket
;(define (map proc items)
 ; (if (null? items)
  ;    nil
   ;   (cons (proc (car items))
    ;        (map proc (cdr items)))))


;(define (sum term a next b)
 ; (if (> a b)
  ;    0
   ;   (+ (term a)
    ;     (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter aa result)
    (if (> aa b)
        result
        (iter (next aa) (+ result (term aa)))))
  (iter a 0))

  (define (identity x) x)
  (define (inc n) (+ n 1))

(define (tripledinced x)(+ 1 (* 3 x)))
(define (dinc x)(+ 2 x))
  
  (sum identity 1 inc 5)
  (sum identity 1 dinc 5)
 (sum tripledinced 1 inc 5)
(sum tripledinced 1 dinc 5)