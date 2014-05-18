;; Calculate the numerical integral of a given function using Simpson's Rule.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define (h) (/ (- b a) n))
  (define (coeff x)
    (cond ((or (= x 0) (= x n)) 1)
          ((even? x) 2)
          (else 4)))
  (define (inc x)
    (+ x 1))
  (define (fy x)
    (* (coeff x) (f (+ a (* x (h))))))
  (* (/ (h) 3) (sum fy 0 inc n)))


;;; Tests

(integral cube 0 1 0.01)                ; .24998750000000042
(simpson-integral cube 0.0 1.0 100)     ; .24999999999999992
(simpson-integral cube 0.0 1.0 1000)    ; .2500000000000003

