#lang racket
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (* -1 x))))
(define (cube x)
  (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
           angle
           (p (sine (/ angle 3.0)))))
(sine pi)
