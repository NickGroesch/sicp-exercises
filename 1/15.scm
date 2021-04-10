#lang racket
(define (cube x) (* x x x))
(define (p x pcount)
        (printf "p time number ~a is ~a\n" pcount x)
        (- (* 3 x) (* 4 (cube x))))
(define (sine angle count pcount)
        (printf "~a ~a \n" count angle)
        (if (not (> (abs angle) 0.1))
            angle
            (p (sine (/ angle 3.0) (+ count 1) (+ 1 pcount)) (+ 1 pcount))))
(sine 12.15 0 0); lookslike it applies 5-6 times (im a little confused why the last printed and returned value are note the same

;interesting, I had imagined the exectuion of this expression as alternating exectutions of p and sine, but special order for IF must means that evaluation is being delayed

;I am assuming that this is a linear algorithm, because at most we have one call of the expression inside its definition
     ;that assumption was bad, this is why we test,
     ;it is however a linear recursive process rather than a tree (I guess that was what I was thinking)

(sine 125 0 0) ;*10 | + 2
(sine 1250 0 0) ;*100 | + 4
(sine 1250000 0 0) ;*1000000 | +10

;something more like (log(n))