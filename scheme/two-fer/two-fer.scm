(import (rnrs))

(define (two-fer . maybe-name)
  (if (null? maybe-name)
      (two-fer "you")
      (string-append "One for "
                     (car maybe-name)
                     ", one for me.")))
