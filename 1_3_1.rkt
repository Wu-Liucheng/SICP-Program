#lang racket

#|函数高阶过程|#
#|(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))
(sum-integers 2 4)
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))
(sum-cubes 1 2)
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
(pi-sum 1 101)|#
(define (cube a)
  (* a a a))
(define (inc n)
  (+ n 1))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)
(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(sum-integers 1 10)
(define (pi-sum a b)
  (define (pi-term a)
    (/ 1.0 (* a (+ a 2))))
  (define (pi-next a)
    (+ a 4))
  (sum pi-term a pi-next b))
(* 8 (pi-sum 1 10000))
#|求定积分|#
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))
(integral cube 0 1 0.001)
  