(import (rnrs))

(define (multirember a lat)
  (cond
   ((null? lat) '())
   ((eq? a (car lat)) (multirember a (cdr lat)))
   (else (cons (car lat)
               (multirember a (cdr lat))))))

(define makeset
  (lambda (lat)
    (cond
     ((null? lat) '())
     (else (cons (car lat)
                 (makeset
                  (multirember (car lat)
                               (cdr lat))))))))

(define (pangram? phrase)
  (eq? 26
       (length
        (filter char-alphabetic?
                (makeset (string->list (string-downcase phrase)))))))
