; Compute the exponential of a given number in a logarithmic number of steps
;
; Example: steps to calculate 2^9
;
; iteration   a    b    n   (a * b^n stays unchanged)
; ------------------------
; 1           1    2    9
; 2           2    2    8
; 3           2    4    4
; 4           2   16    2
; 5           2  256    1
; 6         512  256    0

(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 b n))

