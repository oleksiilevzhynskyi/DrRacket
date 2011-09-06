#lang racket
;e-2
(define (cont-frac n d k)
  (define (golden-requrs counter)
    (+ (d counter) (/ (n counter)
                      (if (< counter k)
                          (golden-requrs (+ counter 1))
                          (d counter)))))
  (/ 1
     (golden-requrs 1)))

(define (lambda-euler x)
  (if (= (remainder x 3) 2)
      (* 2 (/ (+ x 1) 3))
      1))

(define (euler)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                lambda-euler
                60)))

(euler)
;2.7182818284590455