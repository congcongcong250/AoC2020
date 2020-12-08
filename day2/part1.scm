; This attempt uses:
;   - `for-each` over a list, way better
;   - `let*` give a better structure of logic
;     - one liners of local variables calculations in sequence 
;     - except for every line you need to have a local variable
;   - `string-splitter` is a constructor it returns a function
;     - e.g. `(string-splitter 'delimiter #\-)`

(load "../fileIO.scm")
(load "../util.scm")

(define entries (read-lines "input.txt"))

(define res 
  (let ((valid 0))
    (for-each 
      (lambda (entry)
        (let* 
          ((tuple ((string-splitter) (string-replace entry #\: #\Space)))
            (min-max (map string->number ((string-splitter 'delimiter #\-) (first tuple))))
            (c (name->char (second tuple)))
            (str (third tuple))
            (counter 0))
          (string-for-each
            (lambda (sc) 
              (if (eq? sc c) 
                (set! counter (+ counter 1))))
          str)
          (if (and (>= counter (first min-max)) (<= counter (second min-max)))
            (set! valid (+ valid 1)))))
    entries)
    valid))

(if (null? res)
  (print "No result")
  (print "Result is " res))