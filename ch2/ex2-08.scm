;; Define a corresponding subtraction procedure, called sub-interval.

(define (make-interval a b) (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;;; Tests

(define a (make-interval 2 5))
(define b (make-interval 10 11))
(sub-interval b a)                      ; (5 . 9)

