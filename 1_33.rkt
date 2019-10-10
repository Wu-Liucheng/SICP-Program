#lang racket
(define (accumulate-filter filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (accumulate-filter filter combiner null-value term (next a) next b)))
        ((not (filter a)) (accumulate-filter filter combiner null-value term (next a) next b))))

#|define prime?|#
(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (square a)
    (* a a))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (= n (smallest-divisor n)))

#|define prime-sum|#
(define (prime-sum a b)
  (define (prime-sum-term x) x)
  (define (prime-sum-next x) (+ x 1))
  (define (prime-sum-combiner a b) (+ a b))
  (accumulate-filter prime? prime-sum-combiner 0 prime-sum-term a prime-sum-next b))

(prime-sum 5 13)