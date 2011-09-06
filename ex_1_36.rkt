#lang racket
(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display count)
    (display " ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ count 1)))))
  (try first-guess 0))

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             1.1)

(define (avarage x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x) (avarage x (/ (log 1000) (log x))))
             1.1)
;С использование торможения усреднения потребовалось 11 шагов
;без него - 30