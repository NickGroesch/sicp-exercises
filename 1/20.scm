#lang racket
(define (premainder c d)
        (printf "pr ~a ~a \n" c d)
        (remainder c d))


(define (gcd a b)
         (printf "gcd ~a ~a \n" a b)
        (if (= b 0)
         a
        (gcd b (premainder a b))))

;Applicative order is when the operands are evaluated first. Normal-order is when the arguments are substituted into the expression unevaluated.
(gcd 206 40)
;the traces show applicitive order, becuase we are evaluating premaineder between each call to gcd

; Normal Order eval (gcd 206 40)
; ((if (= 40 0)
       ;----206
       ;(gcd 40 (remainder 206 40))
; ((if (= (remainder 206 40) 0) ;6
       ;40
       ;(gcd (remainder 206 40)
            ;(remainder 40 (remainder 206 40)))
; ((if (= (remainder 40 (remainder 206 40)) 0) ; 4
       ;----(remainder 206 40)
       ;(gcd (remainder 40 (remainder 206 40))
            ;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; ((if (=  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)) 0) ; 4
       ;---- (remainder 40 (remainder 206 40))
       ;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))
            ;(remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; ((if (=  (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 2
       ;----  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))
       ;(gcd (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
            ;(remainder  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)) (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; ((if (= (remainder  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)) (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) 0) ; FINALLY
       ; (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       ;;;---SO GLAD I DON"T HAVE TO WRITE THIS OUT
; the question is, and i think the answer, would if have to evaluate its' calls to remainders at each step, while meanwhile the consequent procedure line would just expand out to