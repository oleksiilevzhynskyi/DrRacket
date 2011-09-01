#lang racket
(require rackunit)
(define tolerance 0.00000001)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (double x)
  (+ x x))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1.0))

(check-= (product double 1 inc 5) 3840 tolerance)
;2*4*6*8*10

(check-= (product square 1 inc 5) 14400 tolerance)
;1*4*9*16*25

;вычисление факториала
(define (identity x) x)
(check-= (product identity 1 inc 5) 120 tolerance)
;1*2*3*4*5

;pi/4
(define (next-not-even x)
  (define (next-iter-even x result)
    (if (< x 2)
        result
        (next-iter-even (- x 1) (+ result 2))))
  (next-iter-even x 3))

(define (pi_div_4 x) 
  (/ (* (inc (next-not-even x))
        (dec (next-not-even x)))
     (square (next-not-even x))))

(product pi_div_4 1 inc 1000)
;0.7855943412734705

