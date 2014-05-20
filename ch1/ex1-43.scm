;; Write a procedure that takes as inputs a procedure that computes f and a
;; positive integer n and return the procedure that computes the n-th repeated
;; application of f.

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (lambda (x) (f (f x))) (- n 1))))


;;; Test

((repeated square 2) 5)         ; 625

