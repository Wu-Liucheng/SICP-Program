#lang racket
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (new-element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (new-element-of-set? x (left-branch set)))
        ((> x (entry set))
         (new-element-of-set? x (right-branch set)))))
(define (new-adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set) set))
        ((< x (entry set))
         (make-tree (entry set) (new-adjoin-set x (left-branch set)) (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set) (left-branch set) (new-adjoin-set x (right-branch set))))))


(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
  (copy-to-list tree '()))
(define tree1
   (make-tree 7
           (make-tree 3 '(1 () ()) '(5 () ()))
           (make-tree 9 '() '(11 () ()))))
 (define tree2
  (make-tree 3
             '(1 () ())
             (make-tree 7
                       '(5 () ())
                       (make-tree 9 '() '(11 () ())))))
(tree->list-1 tree1)
(tree->list-2 tree1)
(tree->list-1 tree2)
(tree->list-2 tree2)