;; Write a procedure that combines a collection of terms, using some general
;; accumulation function. Show how sum and product can both be defined as
;; simple calls to accumulate.

;; a) recursive process

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))


;; b) iterative process

(define (accumulate-iter combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner acc (term a))
              (next a))))
  (iter null-value a))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))


;;; Tests

(sum square 5 1+ 11)                ; 476
(product square 5 1+ 11)            ; 2766234240000

(sum-iter square 5 1+ 11)           ; 476
(product-iter square 5 1+ 11)       ; 2766234240000

