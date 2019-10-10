#lang racket
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
      (accumulate op initial (cdr seq))))
  );accumulate

(define (append lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1)
        (append (cdr lst1) lst2)))
  );append

(define (enumerate-interval i j)
  (if (> i j)
      '()
      (cons i
        (enumerate-interval (+ 1 i) j))
      ));enumerate-interval


(define (unique-pairs n)
  (accumulate append
          '()
          (map (lambda(i) (map (lambda (j) (list i j))
                   (enumerate-interval (+ i 1) n)))
           (enumerate-interval 1 n));map
          );accumulate
  );unique-pairs

(unique-pairs 3)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq))
  );flatmap

(define (filter predicate seq)
  (cond ((null? seq) '())
    ((predicate (car seq))
     (cons (car seq) (filter predicate (cdr seq))))
    (else (filter predicate (cdr seq))));cond
  );filter

(define (unique-triple n)
  (flatmap
   (lambda (x) (map (lambda (j) (cons x j))
            (unique-pairs (- x 1)));map
       );lambda
   (enumerate-interval 1 n));flatmap
  );unique-triple

(unique-triple 5)