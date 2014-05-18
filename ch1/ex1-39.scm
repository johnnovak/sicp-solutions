;; Define a procedure (tan-cf x k) that computes an approximation to the
;; tangent function based on Lambert's formula.

(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (let ((ni (n i))
              (di (d i)))
          (/ ni
             (+ di (iter (+ i 1)))))))
  (iter 1))

(define (tan-cf x k)
  (- (cont-frac (lambda(i) (- (if (= i 1) x (square x))))
                (lambda(i) (+ (* (- i 1) 2) 1))
                k)))


;;; Tests

(tan-cf 5 10)           ; -3.380704932187744
(tan-cf 5 100)          ; -3.3805150062465867
(tan-cf 5 1000)         ; -3.3805150062465867

