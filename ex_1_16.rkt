#lang racket
(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (square x)
  (* x x))

(define (fast-expt-iter a b n)
  (if (= n 0)
      a
      (if (even? n)
          (fast-expt-iter a (square b) (/ n 2))
          (fast-expt-iter (* a b) b (- n 1)))))

(fast-expt 6 2)
(fast-expt 5 3)
(fast-expt 7 7)