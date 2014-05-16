; Calculate the sum of squares of the two largest numbers out of three

(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (sum a b c)
  (cond ((and (<= a b) (<= a c)) (sum-square b c))
        ((and (<= b a) (<= b c)) (sum-square a c))
        ((and (<= c a) (<= c b)) (sum-square a b))))

