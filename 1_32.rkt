#lang racket
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        (combiner result null-value)
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
#|sum|#
(define (sum-combiner a b)
  (+ a b))
(define (sum term a next b)
  (accumulate-iter sum-combiner 0 term a next b))
(define (identity x) x)
(define (inc x) (+ x 1))
(sum identity 1 inc 4)
