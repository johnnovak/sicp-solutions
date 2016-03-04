(define (f-recur n)
  (if (< n 3)
      n
      (+ (     f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))

(define (f-iter n)
  (define (iter i n-1 n-2 n-3)
    (if (> i n)
      n-1
      (iter (inc i)
            (+ n-1 (* 2 n-2) (* 3 n-3))
            n-1
            n-2)))
  (if (< n 3)
     n
     (iter 3 2 1 0)))
