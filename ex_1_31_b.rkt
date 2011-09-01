#lang racket
(require rackunit)
(define tolerance 0.00000001)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)) )))
  (iter (next a) (term a) ))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(check-= (sum square 1 inc 5) 14400 tolerance)
;1*4*9*16*25

;произведение значений функции выполнятеся итеративно

