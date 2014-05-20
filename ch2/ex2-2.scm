;; Define a constructor make-segment and selectors start-segment and
;; end-segment that define the representation of segments in terms of points.
;; Furthermore, a point can be represented as a pair of numbers: the x
;; coordinate and the y coordinate. Accordingly, specify a constructor
;; make-point and selectors x-point and y-point that define this
;; representation. Finally, using your selectors and constructors, define a
;; procedure midpoint-segment that takes a line segment as argument and
;; returns its midpoint.

(define (average x y)
  (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))


;;; Tests

(define a (make-point -2. 5.))
(define b (make-point 7. 11.))
(print-point a)                         ; (-2.,5.)
(print-point b)                         ; (7.,11.)

(define s (make-segment a b))
(print-point (midpoint-segment s))      ; (2.5,8.)

