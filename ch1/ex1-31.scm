; Write a procedure called 'product' that returns the product of the values of
; a function at points over a given range

(define (inc x)
  (+ x 1))

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


; Tests

(product square 5 inc 11)           ; 2766234240000
(product-iter square 5 inc 11)      ; 2766234240000

