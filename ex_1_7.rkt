#lang racket

(define (square x)
  (* x x))


(define (good-enough? guess guess_old)
(< (abs (- guess guess_old)) 0.0000001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess guess_old x)
  (if (good-enough? guess guess_old)
      guess
      (sqrt-iter (improve guess x) 
                 guess
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 1.1 x))

(sqrt 0.04)