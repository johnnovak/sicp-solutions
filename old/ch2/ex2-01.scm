;; Define a better version of make-rat that handles both positive and negative
;; arguments. Make-rat should normalize the sign so that if the rational
;; number is positive, both the numerator and denominator are positive, and
;; if the rational number is negative, only the numerator is negative.

(define (abs x) (if (< x 0) (- x) x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;;; Tests

(print-rat (make-rat  3  12))       ; 1/4
(print-rat (make-rat -3  12))       ; -1/4
(print-rat (make-rat  3 -12))       ; -1/4
(print-rat (make-rat -3 -12))       ; 1/4
(newline)

(print-rat (make-rat  3  15))       ; 1/5
(print-rat (make-rat -3  15))       ; -1/5
(print-rat (make-rat  3 -15))       ; -1/5
(print-rat (make-rat -3 -15))       ; 1/5

