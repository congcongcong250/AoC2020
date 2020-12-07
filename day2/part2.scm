(load "../fileIO.scm")

(define entries (read-lines "input.txt"))

(define res 
  (let ((valid 0))
    (for-each 
      (lambda (entry)
        (let* 
          ((tuple ((string-splitter) (string-replace entry #\: #\Space)))
            (pos (map (lambda(x) (- (string->number x) 1)) ((string-splitter 'delimiter #\-) (first tuple))))
            (c (name->char (second tuple)))
            (vec (string->vector (third tuple)))
            (a (vector-ref vec (first pos)))
            (b (vector-ref vec (second pos))))
          (if 
            (not 
              (or 
                (and (eq? c a) (eq? c b)) 
                (and (not (eq? c a)) (not (eq? c b)))))
            (set! valid (+ valid 1)))))
    entries)
    valid))

(if (null? res)
  (log "No result")
  (log "Result is " res))