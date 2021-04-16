#lang racket
;simpsons rule
(define (sum term a next b) (if (> a b)
                                0
                                (+ (term a)
                                   (sum term (next a) next b))))

(define (inc num) (+ num 1))

(define (square v)( * v v))

(define (simpsons f a b n)
     (let ((h (/ (- b a) n)))
              
     (define (pointfree num)
             (printf "~a \n" num)
              num
             (let ((j (* 2 num)))
               (let ((k (+ a (* h j)))
                     (l (+ a (* h (- j 1))))
                     (m (+ a (* h (- j 2)))))
               (+ (f k) (* 4 (f l)) (f m) )))
  )
    (/ (* h
             (sum   pointfree
                    1
                    inc
                    (/ n 2)))
       3)
))

(simpsons square 1 5 2)
(simpsons square 1 5 8)

(define (id x) x); (/ x 100))

(simpsons id 1 5 2)
(simpsons id 1 5 100)
