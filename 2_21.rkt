#lang racket
(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))))
(square-list (list 1 2 3 4 5))
(define (square x)
  (* x x))
(define (square-list-0 items)
  (map square items))
(square-list-0 (list 1 2 3 4 5))