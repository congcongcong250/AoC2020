(load "../fileIO.scm")
(load "../util.scm")

(define entries (map string->number (read-lines "input.txt")))
(define res 
  (let ((entry-map (make-eqv-hash-table)))
    (let loop ((v1  (car entries)) (rest (cdr entries)))
      (define v2 (hash-table/get entry-map v1 '()))
      (if (not (null? v2))
        (* v1 v2)
        (if (null? rest)
          '()
          (begin 
            (hash-table/put! entry-map (- 2020 v1) v1)
            (loop (car rest) (cdr rest))))))))

(if (null? res)
  (print "No result")
  (print "Result is " res))