(load "../fileIO.scm")

(define lines (read-lines "input.txt"))
(define step 3)
(define treeChar #\#)

(define res 
  (let ((i 0)(s 0)(step 3))
    (for-each 
      (lambda(line)
        (let*
          ((lv (string->vector line))
            (j (modulo i (vector-length lv))))
          (map display (list (vector-ref lv 0) (vector-ref lv 1) j))
          (if (eq? treeChar (vector-ref lv j))
            (set! s (+ s 1)))
          (set! i (+ i step))))
    lines)
    s))

(if (null? res)
  (display "No result")
  (map display (list "Result is " res)))