#lang racket
#|example|#
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

#|(define (product a b term next)
  (if (> a b)
      1
      (* (term a)
         (product (next a) b term next))))|#
(define (product a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

#|define factorial|#
(define (identity x) x)
(define (factorial-next x) (+ x 1))
(define (factorial a b)
  (product a b identity factorial-next))
(factorial 1 4)
#|define pi-number|#
(define (pi-term x)
  (/ (* (* 2 x) (* 2 (+ x 1))) (* (+ (* 2 x) 1) (+ (* 2 x) 1))))
(define (pi-next x) (+ x 1))
(define (pi-number a)
  (* 4 (product 1.0 a pi-term pi-next)))
(pi-number 1000)