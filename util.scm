(define (print . l) 
    (map display l)
    (newline)
    l)

; Shorthand for (define (to-x x) (lambda (#!rest r) x))
; `.` does NOT work as `#!rest` here
(define (to-x x) (lambda r x))
(define to-zero (to-x 0))