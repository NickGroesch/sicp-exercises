#lang racket
(define (cube x) (* x x))
(define (average a b) (/ (+ a b) 2))

(define (cubert x)
  ;this regular good enough oscillates
     ;(define (good-enough? guess x)
     ;     (printf "~a \n" guess)
     ;(<  (abs (- (abs(cube guess)) x)) 0.01))


  (define (good-enough? guess last goal)
  (printf "~a ~a ~a\n" guess last  (abs (- guess last)))
  (<= (abs (- guess last)) (/ guess 100)))


  
  (define (improve y x)
    (/ (+ (/ x (* y y))(* 2 y)) 3)
  )
  (define (tryiter guess last x)
    (printf "if no good next try ~a \n"  (improve guess x))
    (if (good-enough? guess last x)
        guess
        (tryiter (improve guess x) guess x)))
  (tryiter 1.0 0.1 x))

(cubert 1001)
(cubert 7162534)