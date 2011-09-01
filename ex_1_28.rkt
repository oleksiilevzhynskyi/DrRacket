#lang racket
(define (square x)
  (* x x))

(define (remainder-check k m r)
  (if (and (not (= k 1))
           (not (= k (- m 1)))
           (= r 1))
      0
      r))

(define (new-remainder k m)
  (remainder-check k m (remainder (square k) m)))

(define (new-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (new-remainder (new-expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (new-expmod base (- exp 1) m))
                    m))))

(define (check a n)
      (= (new-expmod a (- n 1) n) 1))

(define (miller-rabin-iter a t n)
    (if (= a n)
        (> t (/ n 2))
        (if (check a n)
            (miller-rabin-iter (+ a 1) (+ t 1) n)
            (miller-rabin-iter (+ a 1) t n))))
  
(define (miller-rabin-test n)
  (miller-rabin-iter 1 0 n))

(miller-rabin-test 5)
(miller-rabin-test 15)
;Число Кармайкла
(miller-rabin-test 561)