#lang racket
(define (tan-cf x k)
  (define (tan-cf-iter x k i)
    (if (= i k)
        (/ (* x x) (- (* 2 i) 1))
        (/ (* x x) (- (- (* 2 i) 1) (tan-cf-iter x k (+ i 1))))))
  (tan-cf-iter x k 1))
(tan-cf 3.14 1000)