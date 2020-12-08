; This attempt uses:
;   - `(define)` a lot of global variables, NOT very maintainable
;   - `(for-each)` with index manually kept track of
;     - `keyword-constructor` makes keyword-constructor possible
;   - `(begin expression expression ...)`

(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))
(define passports '())
(define cur (make-equal-hash-table))
(define size 0)
(define valid-count 0)

(for-each
  (lambda (line)
    (if (not (eq? 0 (string-length line)))
        (for-each 
          (lambda (pair) 
            (hash-table/put! cur (first pair) (second pair))) 
          (map
            (string-splitter 'delimiter #\:)
            ((string-splitter) line)))
        (begin 
          (set! size (hash-table-size cur))
          (if (or (eq? size 8) (and (null? (hash-table/get cur "cid" '())) (eq? size 7)))
            (set! valid-count (+ valid-count 1)))
          (set! passports (cons cur passports))
          (set! cur (make-equal-hash-table)))))
lines)

(set! size (hash-table-size cur))
(if (or (eq? size 8) (and (null? (hash-table/get cur "cid" '())) (eq? size 7)))
  (set! valid-count (+ valid-count 1)))
(set! passports (cons cur passports))
    
(define res valid-count)

(if (null? res)
  (print "No result")
  (print "Result is " res))