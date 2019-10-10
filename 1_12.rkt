#lang racket
#|帕斯卡三角形|#
#|
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
...
|#
#|递归的版本，计算(pascal 1024 256)就很困难了|#
(define (pascal row col)
  (cond ((< row col) (error "unvalid value"))
        ((or (= row 1) (= row 2) (= col 1) ( = col row)) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))
(pascal 5 3)
#|迭代的版本|#
(define (factorial n) #|迭代计算n!|#
  (factorial-iter 1 1 n))
(define (factorial-iter product counter max-counter)
  (if (> counter max-counter)
      product
      (factorial-iter (* product counter) (+ counter 1) max-counter)))


(define (pascal-iteration row col)
  (/ (factorial row) (* (factorial col) (factorial (- row col)))))
(pascal-iteration 1024 256)
  
  