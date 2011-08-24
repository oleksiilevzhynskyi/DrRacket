#lang racket
(define (runtime)
  (current-milliseconds))

(define (square x)
  (* x x))

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


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
       false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes number-from prime-count)
  (if (> prime-count 0)
      (if (timed-prime-test number-from)
          (search-for-primes (+ number-from 1) (- prime-count 1))
          (search-for-primes (+ number-from 1) prime-count))
      false))

(search-for-primes 100000000000 7)