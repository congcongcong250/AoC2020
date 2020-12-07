(load "../fileIO.scm")
(load "../util.scm")

(define entries (map string->number (read-lines "input.txt")))

(define (get-product-by-sum ls sum)
  (let ((entry-map (make-eqv-hash-table)))
      (let loop ((v1  (car ls)) (rest (cdr ls)))
        (define v2 (hash-table/get entry-map v1 '()))
        (if (not (null? v2))
          (begin 
            (print v1 v2)
            (* v1 v2))
          (if (null? rest)
            '()
            (begin 
              (hash-table/put! entry-map (- sum v1) v1)
              (loop (car rest) (cdr rest))))))))

(define res
  (let outer ((v0  (car entries)) (tail (cdr entries)))
    (if (< (length tail) 2)
      '()
      (let ((p1 (get-product-by-sum tail (- 2020 v0))))
        (if (null? p1)
          (outer (car tail) (cdr tail))
          (begin 
            (print v0 p1)
            (* v0 p1)))))))

(if (null? res)
  (print "No result")
  (print "Result is " res))