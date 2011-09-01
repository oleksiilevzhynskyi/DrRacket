#lang racket

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (calc-integral k)
    (define (const k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
    (* (const k) (f (+ a (* k h)))))
  (define (inc k) (+ k 1))
  (/ (* (sum calc-integral 0 inc n) h) 3))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(simpson cube 0 1.0 100)
;0.24999999999999992
(simpson cube 0 1.0 1000)
;0.2500000000000003


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(integral cube 0 1 0.01)
;0.24998750000000042
(integral cube 0 1 0.001)
;0.249999875000001

;Точное значение интеграла cube от 0 до 1 равно 1/4
;Правило Симпсона дает более точный результат

