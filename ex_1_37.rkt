#lang racket
;рекурсивный процесс
(define (cont-frac n d k)
  (define (golden-requrs counter)
    (+ (d counter) (/ (n counter)
                      (if (> counter k)
                          (d counter)
                          (golden-requrs (+ counter 1))))))
  (golden-requrs 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)
;1.6180339882053252
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           9)
;1.6180555555555556
;чтобы получить приближение, верное с точностью 4 цифры после запятой
;нужно минимум 9 итераций

;итеративнй процесс
(define (cont-frac-iter n d k)
  (define (golden-iter result counter)
    (if (< counter 0)
        result
        (golden-iter (+ (d counter) (/ (n counter) result)) (- counter 1))))
  (golden-iter (+ (d 1) (/ (n 1) (d 1))) k))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)