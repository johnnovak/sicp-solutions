;; Rewrite the 'sum' procedure so that the sum is performed iteratively

(define (inc x)
  (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))


;;; Tests

(sum square 5 inc 11)           ; 476
(sum-iter square 5 inc 11)      ; 476

(sum square 1 inc 1000000)      ; Aborting!: maximum recursion depth exceeded
(sum-iter square 1 inc 1000000) ; 333333833333500000

