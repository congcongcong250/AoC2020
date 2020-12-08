; This attempt uses:
;   - `(define)` global variable
;   - `(define)` structure
;     - `keyword-constructor` makes keyword-constructor possible
;   - `(if)` expression
;     - if the return value is undefined, it would be `#!unspecific` which is truthy
;     - Explicitly return #t and #f to prevent bug
;   - `(reduce)`
;     -  `lambda(cur acc)` arguments passed into lambda is same as javascript

(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))

(define-structure (step keyword-constructor) x y)
(define steps
  (map 
    (lambda(pair)(make-step 'x (first pair) 'y (second pair))) 
    '((1 1) (3 1) (5 1) (7 1) (1 2))))
(define treeChar #\#)

(define (hit-tree-on-line? line line-index stepx stepy)
  (let*
    ((lv (if (string? line) (string->vector line) line))
      (i (* stepx (quotient line-index stepy)))
      (j (modulo i (vector-length lv))))
    (if 
      (and 
        (eq? treeChar (vector-ref lv j))
        (eq? 0 (modulo line-index stepy)))
      #t #f)))

(define res 
  (let ((l 0)(s (map to-zero steps)))
    (for-each
      (lambda (line)
        (set! s 
          (map + s 
            (map 
              (lambda (step)
                (if (hit-tree-on-line? line l (step-x step) (step-y step))
                  1 0))
            steps)))
        (set! l (+ l 1)))
    lines)
    (reduce * 1 s)))

(if (null? res)
  (print "No result")
  (print "Result is " res))