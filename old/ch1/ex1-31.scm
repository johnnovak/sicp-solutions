;; Write a procedure called 'product' that returns the product of the values
;; of a function at points over a given range.

(define (inc x) (+ x 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))


;; Compute the approximation of pi/4:
;; 1 -> 2*4 / 3^2
;; 2 -> 4*6 / 5^2
;; 3 -> 6*8 / 7^2
;; ...
;; n -> 2n * 2(n+1) / (n+1)^2
;;        4n(n+1)

(define (approx-pi times)
  (define (f n)
    (/ (* 4 n (+ n 1))
       (square (+ (* 2 n) 1))))
  (* 4.0 (product-iter f 1 inc times)))


;;; Tests

(product square 5 inc 11)           ; 2766234240000
(product-iter square 5 inc 11)      ; 2766234240000

(approx-pi 100)                     ; 3.1493784731686008
(approx-pi 1000)                    ; 3.142377365093878

