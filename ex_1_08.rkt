#lang racket

(require rackunit)

(define (square x)
  (* x x))

(define (good-enough? guess guess_old)
(< (abs (- guess guess_old)) 0.00001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve y x)
  (/ (+ (/ x
           (square y))
        (* 2 y))
     3))

(define (sqrt-iter guess guess_old x)
  (if (good-enough? guess guess_old)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt3 x)
  (sqrt-iter 1.0 1.1 x))

(check-equal? (sqrt3 27.0) 3)

