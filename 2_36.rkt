#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define (my-car seqs)
  (if (null? seqs)
      null
      (cons (car (car seqs))
            (my-car (cdr seqs)))))

(define (my-cdr seqs)
  (if (null? seqs)
      null
      (cons (cdr (car seqs))
            (my-cdr (cdr seqs)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (my-car seqs))
            (accumulate-n op init (my-cdr seqs)))))
(accumulate-n + 0 matrix)