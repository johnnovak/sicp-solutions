;; Write a procedure smooth that takes as input a procedure that computes f
;; and returns a procedure that computes the smoothed f. The smoothed version
;; of f is the function whose value at a point x is the average of f(x - dx),
;; f(x), and f(x + dx)

(define (smooth f)
  (define dx 1e-10)
  (lambda (x) (/ (+ (f x)
                    (f (- x dx))
                    (f (+ x dx)))
                 3)))


;; Show how to generate the n-fold smoothed function of any given function
;; using smooth and repeated from exercise 1.43.

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (lambda (x) (f (f x))) (- n 1))))

(define (smooth-n f n)
  ((repeated smooth n) f))

