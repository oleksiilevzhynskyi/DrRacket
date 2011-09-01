#lang racket
(require rackunit)
(define tolerance 0.00000001)

(define (accumulate-filter combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (accumulate-filter combiner null-value term (next a) next b filter))
          (accumulate-filter combiner null-value term (next a) next b filter))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

;сумма квадратов простых чисел в интервале от a до b
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(check-= (accumulate-filter + 0 square 1 inc 70 prime?) 24967 tolerance)

;произведение всех положительных целых чисел меньше n, которые просты по отношению к
;n (то есть всех таких положительных целых чисел i < n, что НОД(i, n) = 1).
(define (sum-prome-for-n n)
  (define (prime-for-n? x)
    (= (gcd x n) 1))
  (define (identity x) x)
  (accumulate-filter * 1 identity 1 inc 5 prime?))

(check-= (sum-prome-for-n 5) 30 tolerance)