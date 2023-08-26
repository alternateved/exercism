(import (rnrs))

(define (triangle a b c)
  (cond
   ((or (or-map (lambda (n) (<= n 0)) (list a b c))
        (<= (+ a b) c)
        (<= (+ a c) b)
        (<= (+ b c) a))
    (raise "Invalid triangle"))
   ((= a b c) 'equilateral)
   ((or (= a b) (= a c) (= b c)) 'isosceles)
   (else 'scalene)))
