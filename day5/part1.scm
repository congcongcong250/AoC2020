; This attempt uses:
;   - bit-string: `#*101010`
;     - `(make-bit-string length #f)` return a bit-string filled with 0
;     - `(make-bit-string length #t)` return a bit-string filled with 1
;     - `(bit-string-set! bit i)` set kth bit to 1
;     - `(bit-string-clear! bit i)` set kth bit to 0
;     - `(bit-string->unsigned-integer)`

(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))

(define tracker '())

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
          ; (ept (print "row-str:" row-str "; col-str:" col-str))
          (row (bit-string->unsigned-integer (get-bit row-str #\B #\F)))
          (col (bit-string->unsigned-integer (get-bit col-str #\R #\L)))
          (id (+ col (* row 8))))
        ; (print "row:" row "; col:" col "; id:" id)
        id
        ))
  lines))

(define res (reduce max 0 id-list))

(if (null? res)
  (print "No result")
  (print "Result is " res))