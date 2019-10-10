#lang racket
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (last-pair items)
  (if (= 1 (length items))
      (car items)
      (last-pair (cdr items))))
(define (reverse-1 items)
  (if (null? items)
      null
      (cons (reverse-1 (cdr items)) (car items))))
(define (reverse-2 items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (iter items null))
      
(reverse-1 (list 1 4 9 16 25))
(reverse-2 (list 1 4 9 16 25))
(list 1 4 9 16 25)
      