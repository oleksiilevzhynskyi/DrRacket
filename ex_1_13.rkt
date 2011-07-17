#lang racket

(define (formula sign)
  (/ (sign 1.0 (sqrt 5.0))
     2))
    

(define (fi n)
  ( cond ((= n 1) (formula +))
         (else (* (formula +)
                  (fi (- n 1))))))
  
(define (psi n)
  ( cond ((= n 1) (formula -))
         (else (* (formula -)
                  (psi (- n 1))))))

(define (fib n)
  (/ (- (fi n) (psi n))
     (sqrt 5.0)))


(fib 274)