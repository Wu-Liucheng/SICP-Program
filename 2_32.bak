#lang racket
(define (subnets s)
  (if (null? s)
      (list null)
      (let ((rest (subnets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))
(subnets (list 1 2 3))