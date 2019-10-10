#lang racket
#|递归计算的过程|#
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))
(f 8)
#|迭代的计算过程|#
(define (fun n)
  (fun-iter 2 1 0 n))
(define (fun-iter a b c count)
  (if (= count 0)
      c
      (fun-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
(fun 8)
  