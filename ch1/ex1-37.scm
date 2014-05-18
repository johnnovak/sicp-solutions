;; Define a procedure 'cont-frac' such that evaluating (cont-frac n d k)
;; computes the value of the k-term finite continued fraction.

(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (let ((ni (n i))
              (di (d i)))
          (/ ni
             (+ di (iter (+ i 1)))))))
  (iter 1))

;; Check your procedure by approximating phi using:

(define (approx-phi k)
  (/ 1
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(approx-phi 10)         ; 1.6181818181818184
(approx-phi 13)         ; 1.6180257510729614 - accurate to 4 decimal places
(approx-phi 100)        ; 1.618033988749895

