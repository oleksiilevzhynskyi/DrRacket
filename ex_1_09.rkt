#lang racket

(define (inc i)
  (+ i 1))

(define (dec i)
  (- i 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

;рекурсивная функция


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;итеративныая функция
(+ 4.0 5.0)