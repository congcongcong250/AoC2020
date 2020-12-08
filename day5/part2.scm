; This attempt uses:
;   - `(call/cc)` or `(call-with-current-continuation)`
;     - Used as `return`
;     - Used with a lambda which has a `cc` explicitly passed in, to stop the current continuatino

(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))

(define tracker (make-equal-hash-table))

(define (get-bit str char1 char0)
  (let* 
    ((lg (string-length str))
      (bt (make-bit-string lg #f))
      (i (- lg 1)))
    (string-for-each
      (lambda (c)
        (if (eq? c char1)
          (bit-string-set! bt i))
        (set! i (- i 1)))
    str)
    bt))

(define id-list
  (map 
    (lambda (line)
      (let*
        ((row-str (substring line 0 7)) (col-str (substring line 7 10))
          (row (bit-string->unsigned-integer (get-bit row-str #\B #\F)))
          (col (bit-string->unsigned-integer (get-bit col-str #\R #\L)))
          (id (+ col (* row 8))))
        (hash-table/put! tracker id #t)
        id
        ))
  lines))

(define max (reduce max 0 id-list))
(define min (reduce min 0 id-list))

(define res 
  (call/cc 
    (lambda (cc) 
      (let loop((i min))
        (if (eq? #t (hash-table/get tracker i '()))
          (loop (+ 1 i))
          (cc i))
        ))))

(if (null? res)
  (print "No result")
  (print "Result is " res))