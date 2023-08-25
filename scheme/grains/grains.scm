(import (rnrs))

(define (range s e)
  (cond
   ((> s e) '())
   (else (cons s (range (+ s 1) e)))))

(define (square-impl n)
  (cond
   ((zero? n) 1)
   (else (* 2 (square-impl (- n 1))))))

(define (square n)
  (if (or (< n 1) (> n 64))
      (raise "Index out of bounds")
      (square-impl (- n 1))))

(define total
  (apply + (map square (range 1 64))))
