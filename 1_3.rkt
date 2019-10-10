#lang racket
#|先求出最小值，再用三个的和减去最小值，即是求两个较大数之和|#
(define (max2 x y)
  (if(> x y) x
  y))
(define (add x y z) (+ x y z))
(define (min2 x y)
  (if(< x y) x
     y))
(define (min3 x y z)
  (min2 x (min2 y z)))
(define (fun x y z)
  (- (+ x y z) (min3 x y z)))
(fun 3 4 5)

