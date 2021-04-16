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
;33
(define (filtered-accumulate combiner null-term filter term a next b)
  (define (iter aa result)
    (if (> aa b)
        result
        (iter (next aa) (if (filter aa)
                            (combiner result (term aa))
                            result ))))
  (iter a null-term))
;something is amiss
(define (blam t a n b)(filtered-accumulate + 0 even? t a n b))

(define (sumaccum t a n b)(accumulate + 0 t a n b))

(define (prodaccum t a n b)(accumulate * 1 t a n b))
;helpers
  (define (identity x) x)
  (define (inc n) (+ n 1))

(define (tripledinced x)(+ 1 (* 3 x)))
(define (dinc x)(+ 2 x))
(define (even? n)(= (remainder n 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fp25? n) (fast-prime? n 25));this is a closure?(and would suss&steele approve of this usage?) i created to make the filter paramater unary

(define (smallest-divisor n) (find-divisor n 2))

(define (next-divisor x)(if(= x 2) 3 (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)(= n (smallest-divisor n)))

(define (square x) (* x x ))

(define (expmod base exp m);g(f)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else(remainder (* base (expmod base (- exp 1) m))
                        m))))

  ;the tests
;;30
;(sum identity 1 inc 5)
;(sum identity 1 dinc 5)
;(sum tripledinced 1 inc 5)
;(sum tripledinced 1 dinc 5)
;;31
;(product identity 1 inc 5)
;(product identity 1 dinc 5)
;(product tripledinced 1 inc 5)
;(product tripledinced 1 dinc 5)

;32
;(sumaccum identity 1 inc 5)
;(sumaccum identity 1 dinc 5)
;(sumaccum tripledinced 1 inc 5)
;(sumaccum tripledinced 1 dinc 5)
;(prodaccum identity 1 inc 5)
;(prodaccum identity 1 dinc 5)
;(prodaccum tripledinced 1 inc 5)
;(prodaccum tripledinced 1 dinc 5)

;33 aleph
;(blam identity 1 inc 9)
;(blam identity 1 dinc 9)

;33 a
;(filtered-accumulate + 0 prime? square 3 inc 5 )
;(filtered-accumulate + 0 prime? square 1 inc 11 )

(define (relatively-prime? n i)
  (if (=  (gcd n i) 1)
      true
      false))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;(filtered-accumulate * 1 relatively-prime? identity 1 inc 11 );ths won't work because reatively prime will be binary
( define (ex33b n)
(filtered-accumulate * 1 (lambda (x)( relatively-prime? x n)) identity 1 inc n )) ;;i couldn't figure out how to do this lambda as a regular definition

;(define (relatively-prime?-gen upperlimit )
  ;(rel))
(ex33b 5)
(ex33b 6)
(ex33b 7)
(ex33b 8)
(ex33b 9)
(ex33b 10)
(ex33b 11)
(ex33b 12)
(ex33b 13)
(ex33b 14)
(ex33b 15)
(ex33b 60)
