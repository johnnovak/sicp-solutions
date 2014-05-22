;; Define one and two directly (not in terms of zero and add-1). Give a direct
;; definition of the addition procedure + (not in terms of repeated
;; application of add-1).

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

