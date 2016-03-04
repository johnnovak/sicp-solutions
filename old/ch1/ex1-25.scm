(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (time)
  (internal-time/ticks->seconds (real-time-clock)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (time)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

