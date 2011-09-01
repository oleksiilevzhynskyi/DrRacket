#lang racket
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)) )))
  (iter (next a) (term a)))

(define (multiply x)
  (* x x))

(define (inc x)
  (+ x 1))

(sum multiply 1 inc 5)
; 55

;суммирование выполнятеся итеративно