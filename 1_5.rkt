#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0) 0
      y))
(test 0 (p))
#|一般lisp的解释器都是采用应用序进行求值|#