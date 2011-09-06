#lang racket
(define (tan-cf x k)
  (define (tan counter)
    (- (- (* counter 2) 1) (/ (square x)
                      (if (> counter k)
                          (- (* (+ counter 1) 2) 1)
                          (tan (+ counter 1))))))
  (/ x
     (tan 1)))

(define (square x)
  (* x x))

(tan-cf 1.0 10)
;1.557407724654902