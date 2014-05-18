;; Write an even more general version of accumulate (exercise 1.32) by
;; introducing the notion of a filter on the terms to be combined.

(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (if (filter a) (combiner acc (term a)) acc)
              (next a))))
  (iter null-value a))


;; a) the sum of the squares of the prime numbers in the interval a to b

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filtered-sum filter term a next b)
  (filtered-accumulate + filter 0 term a next b))

(define (sum-prime-squares a b)
  (filtered-sum prime? square a 1+ b))


;; b) the product of all the positive integers less than n that are relatively
;; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (filtered-product filter term a next b)
  (filtered-accumulate * filter 1 term a next b))

(define (product-relative-primes n)
  (define (identity x) x)
  (define (relative-prime? x)
    (= (gcd x n) 1))
  (filtered-product relative-prime? identity 1 1+ (- n 1)))


;;; Tests

(sum-prime-squares 2 3)             ; 13
(sum-prime-squares 10 50)           ; 55330
(product-relative-primes 10)        ; 189
(product-relative-primes 11)        ; 3628800

