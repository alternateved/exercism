(import (rnrs))

(define (range s e)
  (cond
   ((> s e) '())
   (else (cons s (range (+ s 1) e)))))

(define (square x) (* x x))

(define (square-of-sum n)
  (square (apply + (range 1 n))))

(define (sum-of-squares n)
  (apply + (map square (range 1 n))))

(define (difference-of-squares n)
  (- (square-of-sum n)
     (sum-of-squares n)))
