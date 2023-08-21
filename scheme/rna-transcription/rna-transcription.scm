(import (rnrs))

(define (transcribe n)
  (case n
    ((#\G) #\C)
    ((#\C) #\G)
    ((#\T) #\A)
    ((#\A) #\U)))

(define (dna->rna dna)
  (list->string (map transcribe (string->list dna))))
