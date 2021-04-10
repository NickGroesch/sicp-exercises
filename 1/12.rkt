#lang racket
;pascals triangle

;(define (map proc items)
 ; (if (null? items)
  ;    nil
   ;   (cons (proc (car items))
    ;        (map proc (cdr items)))))


(define (expand sequence)
  (define (expander last seq)   
    (if (null? seq)
        (list last)
        (cons (+ (car seq) last)
              (expander (car seq)
                        (cdr seq) ))))
   (expander 0 sequence))
(expand (list 1 3 3 1))


(define (pascal n) 
        (define (pascaliter seq iteration)
                (printf "~a ~a\n" iteration seq)   
                (if (= iteration n)
                     seq
                     (pascaliter (expand seq) (+ iteration 1))))
        (pascaliter (list 1) 0))

(pascal 9)