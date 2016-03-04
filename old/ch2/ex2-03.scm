;; Implement a representation for rectangles in a plane. In terms of your
;; constructors and selectors, create procedures that compute the perimeter
;; and the area of a given rectangle. Now implement a different representation
;; for rectangles.

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (perim-rect r)
  (+ (* (width-rect r) 2)
     (* (height-rect r) 2)))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))

;; (define (make-rect top-left width height)
;;   (cons top-left (cons width height)))
;;
;; (define (width-rect r)
;;   (car (cdr r)))
;;
;; (define (height-rect r)
;;   (cdr (cdr r)))


;; Alternate rectangle representation

(define (make-rect top-left width height)
  (let ((bottom-right (make-point (+ (x-point top-left) width)
                                  (+ (y-point top-left) height))))
    (cons top-left bottom-right)))

(define (width-rect r)
  (- (x-point (cdr r))
     (x-point (car r))))

(define (height-rect r)
  (- (y-point (cdr r))
     (y-point (car r))))


;;; Tests

(define r (make-rect (make-point -2 4) 12 15))

(newline)
(display (perim-rect r))          ; 54

(newline)
(display (area-rect r))           ; 180

