;; Write a program that uses your 'cont-frac' procedure from exercise 1.37 to
;; approximate e, based on Euler's expansion.
;;
;; In this fraction, the Ni are all 1, and the Di are successively
;; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...
;;
;; The result of this continued fraction expansion will be e - 2, where e is
;; the base of the natural logarithms.

(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (let ((ni (n i))
              (di (d i)))
          (/ ni
             (+ di (iter (+ i 1)))))))
  (iter 1))

(define (approx-e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) (if (= (remainder (- i 2) 3) 0)
                                (* (+ (/ (- i 2) 3) 1) 2)
                                1))
                k)))


;;; Tests

(approx-e 10)         ; 2.7182817182817183
(approx-e 100)        ; 2.7182818284590455
(approx-e 1000)       ; 2.7182818284590455

