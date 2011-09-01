#lang racket

(define (square x)
  (* x x))

(define (test-carmichae n)
  (test-for-all n 1))

(define (test-for-all n start)
  (if (< start n)
      (if (test start n)
          (test-for-all n (+ start 1))
          #f)
      #t))

(define (test a n)
  (= (expmod a n n) a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(test-carmichae 1009)
(test-carmichae 1008)
;Числа Кармайкла
(test-carmichae 561)
(test-carmichae 2821)