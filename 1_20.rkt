#lang racket
#||#
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 7 21)
#|https://blog.csdn.net/levinjoe/article/details/40708805|#