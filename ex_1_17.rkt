#lang racket
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (multiply a (halve b))))
        (else (+ a (multiply a (- b 1))))))

(multiply 7 3)
(multiply 6 2)
(multiply 17 34)