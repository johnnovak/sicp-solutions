;; Modify the code to check for the condition when trying to divide an
;; interval by another interval that spans zero, and signal an error if it
;; occurs.

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "Divisor interval spans zero"))
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))


;;; Tests

(div-interval (make-interval 2 10)
              (make-interval -2 -1))            ; OK

(div-interval (make-interval -2 10)
              (make-interval 1 3))              ; OK

(div-interval (make-interval -3 0)
              (make-interval 1 3))              ; OK

(div-interval (make-interval 1 3)
              (make-interval 0 3))              ; ERROR

(div-interval (make-interval 1 3)
              (make-interval -3 0))             ; ERROR

(div-interval (make-interval 1 3)
              (make-interval 0 0))              ; ERROR

(div-interval (make-interval 1 3)
              (make-interval -1 1))             ; ERROR

