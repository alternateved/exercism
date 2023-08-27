(import (rnrs))

(define (collatz n)
  (cond
   ((eq? n 1) 0)
   (else
    (+ 1
       (if (even? n)
           (collatz (/ n 2))
           (collatz (+ 1 (* n 3))))))))

