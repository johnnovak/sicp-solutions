;; Show that we can represent pairs of nonnegative integers using only numbers
;; and arithmetic operations if we represent the pair a and b as the integer
;; that is the product 2^a * 3^b. Give the corresponding definitions of the
;; procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 a)))

(define (car x)
  )

(define (cdr x)
  )

;;; Tests

(car (cons 11 17))          ; 11
(cdr (cons 11 17))          ; 17

