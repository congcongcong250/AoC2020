; In a function argument/parameter list
; scheme uses `. rest` to "packages up the extra arguments in a list, called a rest list."
; ref: https://www.cs.utexas.edu/ftp/garbage/cs345/schintro-v14/schintro_68.html

(define (print . l) 
    (map display l)
    (newline)
    l)

; `#!rest rest` is another syntax defined by mit-scheme
; along with `#!optional`, used as `(a b #!optional c d #!rest e)`
; ref: https://groups.csail.mit.edu/mac/ftpdir/scheme-7.4/doc-html/scheme_3.html

; Shorthand for (define (to-x x) (lambda (#!rest r) x))
; `.` does NOT work as "rest list" here
(define (to-x x) (lambda r x))
(define to-zero (to-x 0))

(define (min a b) (if (< a b) a b))
(define (max a b) (if (> a b) a b))

(define call/cc call-with-current-continuation)
