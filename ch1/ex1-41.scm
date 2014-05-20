;; Define a procedure double that takes a procedure of one argument as
;; argument and returns a procedure that applies the original procedure twice.

(define (double f)
  (lambda(x) (f (f x))))

(define (inc x)

;;; Tests

((double inc) 1)                        ; 3
(((double (double double)) inc) 5)      ; 21

