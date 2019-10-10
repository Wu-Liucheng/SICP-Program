#lang racket
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(define (cons a b)
  (lambda (m) (m (expt 2 a) (expt 3 b))))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))
(car (cons 3 3))
(cdr (cons 3 3))