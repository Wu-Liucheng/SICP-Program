#lang racket
#|假设我们的语言没有乘法|#
#|此为相对于b的线性步数|#
(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))
(mul 7 3)
#||#
(define (double x)
  (+ x x))
(define (halve n)
  (/ n 2))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b)(double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))
(fast-mul 7 5)