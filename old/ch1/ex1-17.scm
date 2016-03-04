;; Calculate the product of two numbers in a logarithmic number of steps using
;; the double and halve procedures

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-mul a b)
  (define (mul-iter s a b)
    (cond ((= b 0) s)
          ((even? b) (mul-iter s (double a) (halve b)))
          (else (mul-iter (+ s a) a (- b 1)))))
  (mul-iter 0 a b))

