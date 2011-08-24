;Определите процедуру, которая принимает в качестве аргументов три числа и возвращает сумму
;квадратов двух больших из них.
#lang racket

(define (square x) (* x x))

(define (sum-of-square a b c)
  (if (> a b) 
      (if (> b c)
          (+ (square a) (square b))
          (+ (square a) (square c)))
      (if (> a c)
          (+ (square b) (square a))
          (+ (square b) (square c)))))
(sum-of-square 1 6 2)
;40