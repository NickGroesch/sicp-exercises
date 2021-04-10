#lang racket

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  ;(printf "~a ~a ~a ~a ~a \n" a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (+ (* p p) ( * q q))
                                 (+ (* 2 p q) (* q q))
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 3)
(fib 4)
(fib 5)
(fib 40)
(fib 100)
(fib 1000)
(fib 10000)
(fib 1000000)

;;       function application c is new a and d is new b
;;               actucal algebreic equals below
;   c= bq + aq + ap
;   d= bp + aq

;;       now we gotta apply a secondtime
;   e= dq + cq + cp
;   f= dp + cq

;          now we recast e/f in terms of a/b
;   e = q(bp + aq) +q(bq + aq + ap) + p(bq + aq + ap)
;   f = p(bp + aq) + q(bq + aq + ap)

; simplify e
; e = bpq + aqq +bqq + aqq + apq + bpq + apq + app
;   = 2bpq + 2aqq + 2apq + app
; psyche that didn't simplify anything

;im gonna recast f as a d with a new p and q, henceforth r and x, rather than
; f = br + ax = bpp + apq + bqq + aqq + apq = b(pp +qq) + a(2pq + pp)
; r = pp+qq
; x = 2pq + pp