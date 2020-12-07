(define (print . l) 
    (map display l)
    (newline)
    l)

(define (to-x x) (lambda r x))
(define to-zero (to-x 0))