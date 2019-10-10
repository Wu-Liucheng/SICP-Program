#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
(accumulate - 0 (list 1 2 3 4 5))
(fold-left - 0 (list 1 2 3 4 5))
(accumulate list null (list 1 2 3))
(fold-left list null (list 1 2 3))