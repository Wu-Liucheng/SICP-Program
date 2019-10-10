#lang racket
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (last-pair items)
  (if (= 1 (length items))
      (car items)
      (last-pair (cdr items))))
(last-pair (list 23 72 149 34))