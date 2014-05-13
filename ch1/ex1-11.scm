; f(n) = n, if n<3
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3), if n> 3

(define (f-recur n)
  (if (< n 3)
      n
      (+      (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))


(define (f-iter n)
  (define (f f1 f2 f3 curr)
    (if (> curr n)
        f1
        (f (+ f1 (* 2 f2) (* 3 f3))
           f1
           f2
           (+ curr 1))))
  (if (< n 3)
      n
      (f 2 1 0 3)))

