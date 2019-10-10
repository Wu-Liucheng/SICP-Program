#lang racket
#|1_19|#
(define (even? n)
  (= (remainder n 2) 0))
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q counter)
  (cond ((= counter 0) b)
        ((even? counter) (fib-iter a b (+ (* q q) (* p p)) (+ (* 2 p q) (* q q)) (/ counter 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- counter 1)))))
(fib 5)
        