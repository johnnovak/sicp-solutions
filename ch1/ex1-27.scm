;; Demonstrate that the Carmichael numbers listed really do fool the Fermat
;; test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (congruent-modulo? a n)
  (= (expmod a n n) a))

(define (test-carmichael n)
  (define (test-carmichael-iter a)
    (if (= a 0)
        true
        (if (congruent-modulo? a n)
            (test-carmichael-iter (- a 1))
            false)))
  (test-carmichael-iter (- n 1))) 


;;; Tests

(test-carmichael 561)       ; true
(test-carmichael 1105)      ; true
(test-carmichael 1729)      ; true
(test-carmichael 2465)      ; true
(test-carmichael 2821)      ; true
(test-carmichael 6601)      ; true

