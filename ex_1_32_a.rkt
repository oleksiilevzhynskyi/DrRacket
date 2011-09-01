#lang racket
(require rackunit)
(define tolerance 0.00000001)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(check-= (accumulate + 0 square 1 inc 5) 55 tolerance)
(check-= (accumulate * 1 square 1 inc 5) 14400 tolerance)