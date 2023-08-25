(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (unless (= (string-length strand-a) (string-length strand-b))
    (raise "Different strand lenghts"))
  (fold-left (lambda (total a b)
               (if (eq? a b)
                   total
                   (+ 1 total)))
             0
             (string->list strand-a)
             (string->list strand-b)))



