; Calculate the square root of a given number by means of successive
; approximations using Heron of Alexandria's method

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-approx x)
  (define (sqrt-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
        guess
        (sqrt-iter (improve guess)
                   guess)))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (good-enough? guess prev-guess)
    (< (/ (abs (- guess prev-guess))
          guess)
       0.001))

  (sqrt-iter 1.0 0))

