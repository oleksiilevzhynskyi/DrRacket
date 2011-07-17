#lang racket

(define (inc i)
  (+ i 1))

(define (dec i)
  (- i 1))

;(define (+ a b)
  ;(if (= a 0)
      ;b
      ;(inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4.0 5.0)

;обе функции итеративные