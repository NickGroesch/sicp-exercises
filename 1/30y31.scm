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

;30;
(define (sum term a next b)
  (define (iter aa result)
    (if (> aa b)
        result
        (iter (next aa) (+ result (term aa)))))
  (iter a 0))
;31a
(define (product term a next b)
  (define (iter aa result)
    (if (> aa b)
        result
        (iter (next aa) (* result (term aa)))))
  (iter a 1))
;31b NOT GONNA DO IT why would I bother refactoring to something less space effecient? NUGATORY
;32 
(define (accumulate combiner null-term term a next b)
  (define (iter aa result)
    (if (> aa b)
        result
        (iter (next aa) (combiner result (term aa)))))
  (iter a null-term))
;32b also NUGATORY



(define (sumaccum t a n b)(accumulate + 0 t a n b))

(define (prodaccum t a n b)(accumulate * 1 t a n b))
;
  (define (identity x) x)
  (define (inc n) (+ n 1))

(define (tripledinced x)(+ 1 (* 3 x)))
(define (dinc x)(+ 2 x))



  ;the tests
;30
(sum identity 1 inc 5)
(sum identity 1 dinc 5)
(sum tripledinced 1 inc 5)
(sum tripledinced 1 dinc 5)
;31
(product identity 1 inc 5)
(product identity 1 dinc 5)
(product tripledinced 1 inc 5)
(product tripledinced 1 dinc 5)
;32
(sumaccum identity 1 inc 5)
(sumaccum identity 1 dinc 5)
(sumaccum tripledinced 1 inc 5)
(sumaccum tripledinced 1 dinc 5)
(prodaccum identity 1 inc 5)
(prodaccum identity 1 dinc 5)
(prodaccum tripledinced 1 inc 5)
(prodaccum tripledinced 1 dinc 5)