;; By testing the signs of the endpoints of the intervals, it is possible to
;; break mul-interval into nine cases, only one of which requires more than
;; two multiplications. Rewrite this procedure using this suggestion.

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (mul-interval-fast x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))

    (cond ((and (positive? a) (positive? b))
           (cond ((and (positive? c) (positive? d))
                  (make-interval (* (min a b) (min c d))
                                 (* (max a b) (max c d))))
                 ((and (negative? c) (negative? d))
                  (make-interval (* (max a b) (min c d))
                                 (* (min a b) (max c d))))
                 (else
                  (make-interval (* (max a b) (min c d))
                                 (* (max a b) (max c d))))))

          ((and (negative? a) (negative? b))
           (cond ((and (positive? c) (positive? d))
                  (make-interval (* (min a b) (max c d))
                                 (* (max a b) (min c d))))
                 ((and (negative? c) (negative? d))
                  (make-interval (* (max a b) (max c d))
                                 (* (min a b) (min c d))))
                 (else
                  (make-interval (* (min a b) (max c d))
                                 (* (min a b) (min c d))))))

          ((and (positive? c) (positive? d))
           (cond ((and (negative? c) (negative? d))
                  (make-interval (* (min a b) (max c d))
                                 (* (max a b) (min c d))))
                 (else
                  (make-interval (* (min a b) (max c d))
                                 (* (max a b) (max c d))))))

          ((and (negative? c) (negative? d))
           (cond ((and (positive? c) (positive? d))
                  (make-interval (* (max a b) (min c d))
                                 (* (min a b) (max c d))))
                 (else
                  (make-interval (* (max a b) (min c d))
                                 (* (min a b) (min c d))))))

          (else (mul-interval x y)))))


(define (make-interval a b) (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))


;;; Tests

(define (print-interval x)
  (display "[")
  (display (lower-bound x))
  (display ", ")
  (display (upper-bound x))
  (display "]"))

(define (equal-interval a b)
  (and (= (lower-bound a) (lower-bound b))
       (= (upper-bound a) (upper-bound b))))

(define (test a b)
  (let ((x (mul-interval a b))
        (y (mul-interval-fast a b)))
    (display "x: ")
    (print-interval x)
    (display ", y: ")
    (print-interval y)
    (cond ((equal-interval x y)
           (display " -- OK"))
          (else
           (display " -- *** ERROR *** ")))
    (newline)))

(test (make-interval  7  3) (make-interval  5  11))
(test (make-interval  7  3) (make-interval  5 -11))
(test (make-interval  7  3) (make-interval -5  11))
(test (make-interval  7  3) (make-interval -5 -11))
(test (make-interval  7 -3) (make-interval  5  11))
(test (make-interval  7 -3) (make-interval  5 -11))
(test (make-interval  7 -3) (make-interval -5  11))
(test (make-interval  7 -3) (make-interval -5 -11))
(test (make-interval -7  3) (make-interval  5  11))
(test (make-interval -7  3) (make-interval  5 -11))
(test (make-interval -7  3) (make-interval -5  11))
(test (make-interval -7  3) (make-interval -5 -11))
(test (make-interval -7 -3) (make-interval  5  11))
(test (make-interval -7 -3) (make-interval  5 -11))
(test (make-interval -7 -3) (make-interval -5  11))
(test (make-interval -7 -3) (make-interval -5 -11))

