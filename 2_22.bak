#lang racket
(define (square x)
  (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things)) answer))))
  (iter items null))
(square-list (list 1 2 3 4 5))
(define (square-list-0 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items null))
(square-list-0 (list 1 2 3 4 5))