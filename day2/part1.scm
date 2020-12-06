(load "../fileIO.scm")

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
  (display "No result")
  (map display (list "Result is " res)))