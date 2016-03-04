;; Compute the golden ratio f(x) = 1 + 1/x by means of the fixed-point procedure.

(define tolerance 1e-20)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))


;;; Test

(golden-ratio)          ; 1.618033988749895
