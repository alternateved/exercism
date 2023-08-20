(import (rnrs))

(define (leap-year? year)
  (or (and (eq? (modulo year 4) 0)
           (not (eq? (modulo year 100) 0)))
      (eq? (modulo year 400) 0)))

