(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))
(define tracker '())
(define sums '())

(define cur (make-equal-hash-table))

(define (wrap-group) 
  (set! sums (cons (hash-table-size cur) sums))
  (set! tracker (cons cur tracker))
  (set! cur (make-equal-hash-table)))

(for-each
  (lambda (line)
    (if (not (eq? 0 (string-length line)))
        (string-for-each 
          (lambda (c) 
            (hash-table/put! cur c #t)) 
          line)
        (wrap-group)))
lines)

(wrap-group)
    
(define res (reduce + 0 sums))

(if (null? res)
  (print "No result")
  (print "Result is " res))