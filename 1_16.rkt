#lang racket
(define (square x)
  (* x x))
#||#
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(expt 134 25)
#||#
(define (expt-iteration b n)
  (expt-iteration-iter 1 b n))
(define (expt-iteration-iter product element counter)
  (if (> 1 counter)
      product
      (expt-iteration-iter (* product element) element (- counter 1))))
(expt-iteration 134 25)
#||#
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(fast-expt 134 25)
#||#
(define (fast-expt-iteration b n)
  (fast-expt-iteration-iter 1 b n))
(define (fast-expt-iteration-iter product element counter)
  (cond ((= 0 counter) product)
        ((even? counter) (fast-expt-iteration-iter (* product (square element)) (square element) (- (/ counter 2) 1)))
        (else (fast-expt-iteration-iter (* product element) element (- counter 1)))))
(fast-expt-iteration 134 25)