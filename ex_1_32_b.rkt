#lang racket
(require rackunit)
(define tolerance 0.00000001)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter combiner a result)
    (if (> a b)
        result
        (iter combiner (next a) (combiner result (term a)))))
  (iter combiner (next a) (term a)))


(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(check-= (accumulate-iter + 0 square 1 inc 5) 55 tolerance)
(check-= (accumulate-iter * 1 square 1 inc 5) 14400 tolerance)

;итеративный методы