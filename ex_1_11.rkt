#lang racket

(define (f-recurs n)
  (if (< n 3)
      n
      (+ (f-recurs (- n 1))
         (f-recurs (- n 2))
         (f-recurs (- n 3)))))
;рекурсивно
(f-recurs 5)


(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))))
;итеративно
(f 5)