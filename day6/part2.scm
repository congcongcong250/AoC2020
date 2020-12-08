(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))
(define tracker '())
(define sums '())


(define cur (make-equal-hash-table))
(define i 0)

(define (wrap-group)
  (let ((agreed-list (filter (lambda(p)(if (eq? i (cdr p)) #t #f)) (hash-table->alist cur))))
    (set! sums (cons (length agreed-list) sums))
    (hash-table/put! cur "people" i)
    (set! tracker (cons cur tracker))
    (set! cur (make-equal-hash-table))
    (set! i 0)))

(for-each
  (lambda (line)
    (if (not (eq? 0 (string-length line)))
      (begin
        (set! i (+ 1 i))
        (string-for-each 
          (lambda (c) 
            (hash-table/put! cur c (+ 1 (hash-table/get cur c 0))))
          line))
      (wrap-group)))
lines)

(wrap-group)
    
(define res (reduce + 0 sums))

(if (null? res)
  (print "No result")
  (print "Result is " res))