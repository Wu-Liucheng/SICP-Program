#lang racket
(define x (list (list 1 2) (list 3 4)))
x
(define (reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (iter items null))
(reverse x)
(define (deep-reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (let ((first (car items)))
          (iter (cdr items)
                (cons (if (pair? first)
                          (deep-reverse first)
                          first)
                      result)))))
  (iter items null))
(deep-reverse x)