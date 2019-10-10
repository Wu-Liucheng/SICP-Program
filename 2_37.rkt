#lang racket
(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2 3 4) (list 3 4 5 6) (list 5 6 7 8)))
(define v (list 1 2 3 4))
(define w (list 5 6 7 8))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
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

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(dot-product v w)
(define (matrix-*-vector m v)
  (map (lambda (col) (dot-product col v)) m))
(matrix-*-vector n v)
(define (transpose mat)
  (accumulate-n cons null mat))
(transpose matrix)
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (col-of-m)
           (map (lambda (col-of-cols)
                  (dot-product col-of-m
                               col-of-cols))
                cols))
         m)))
(matrix-*-matrix matrix (transpose matrix))