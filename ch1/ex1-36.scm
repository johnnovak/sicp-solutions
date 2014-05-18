;; Modify 'fixed-point' so that it prints the sequence of approximations it
;; generates, using the 'newline' and 'display'.
;;
;; Then find a solution to x^x = 1000 by finding a fixed point of
;; f(x) = log(1000)/log(x)

(define tolerance 1e-5)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "guess: ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

(define (f)
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
               2))

(define (average x y)
  (/ (+ x y) 2))

(define (f-damped)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
               2))


;;; Tests

(f)             ; 34 steps, guess: 4.555540912917957
(f-damped)      ;  9 steps, guess: 4.5555465521473675

