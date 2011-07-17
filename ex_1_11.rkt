#lang racket

; расчет эл-та из треуголника паскаля
; левый нижний угол имеет координаты (1, 1)

(define (dec i)
  (- i 1))

(define (pascal x y)
  (cond ((= x 1) 1)
        ((= y 1) 1)
        (else (+ (pascal (dec x) y) (pascal x (dec y))))))

(pascal 5 5)
        