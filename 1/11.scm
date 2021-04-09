#lang racket
; f(n)= n if n<3, f(n-1)+2f(n-2)+3f(n-3) if n≥3.
;TODO recursive
(define (f n)
        ;(printf "~a\n" n)
        (if (< n 3)
              n
              (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))
                 )))

;TODO iterative
;although the first fib procedure is much less efficient than the second one, it is more straightforward, being lile more than a translation into Lisp of the definition of the Fibonacci se- quence.
;To formulate the iterative algorithm required noticing that the computation could be recast as an iteration with three state variables.

(define (fiter N)
  (define (helper a b c counter)
    (printf "helper ~a ~a ~a ~a \n" a b c counter)
    (if (= counter N)
                        (+ c (* 2 b) (* 3 a))
        (helper         (+ c (* 2 b) (* 3 a))
                (* 2 c)
                (* 3 b)
                (+ counter 1))
    ))
  (if (< N 3) N (helper 0 1 2 3))
  )

(f 1)
(f 2)
(print "-3-")
(f 3)
(fiter 3)
(print "-4-")
(f 4)
(fiter 4)
(print "-5-")
(f 5)
(fiter 5)
(print "-6-")
(f 6)
(fiter 6)