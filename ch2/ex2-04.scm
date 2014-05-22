;; Here is an alternative procedural representation of pairs. For this
;; representation, verify that (car (cons x y)) yields x for any objects x and
;; y. What is the corresponding definition of cdr?

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))


;;; Tests

(car (cons 4 5))        ; 4
(cdr (cons 4 5))        ; 5

