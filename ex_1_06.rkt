#lang racket
(use-package :lisp-unit)

(define (square x)
  (* x x))


(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.04)

;Происходит зацикливание т.к. в new-if проверяются все условия и sqrt-iter будет
; вызывать сама себя бесконечно