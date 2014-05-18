;; Calculate an element of Pascal's triangle using a recursive process

(define (pascal row col)
  (if (or (= col 0) (= col row))
      1
      (+ (pascal (- row 1) (- col 1))
         (pascal (- row 1) col))))


;;; Tests

(pascal 0 0)    ; 1
(pascal 1 0)    ; 1
(pascal 1 1)    ; 1
(pascal 2 0)    ; 1
(pascal 2 1)    ; 2
(pascal 2 2)    ; 1
(pascal 3 2)    ; 3
(pascal 4 2)    ; 6
(pascal 4 3)    ; 4

