# hashMap and lambda rest

- `'()` is used as null in lisp
- use `map` and `display` to display concatenated strings and numbers

```scheme
(map display
 (list "Rolling " (- 5 (length my-rolled-dice))
       " dice\nYou rolled\n" my-roll "\n"))
```

## hashTable

### Create

`create-eq-hash-table`

`create-eqv-hash-table`

`create-equal-hash-table`

`create-string-hash-table`

### Manipulate

`hash-table/put!`

`hash-table/get`

`hash-table->alist`

## lambda rest (rest parameter)

https://groups.csail.mit.edu/mac/ftpdir/scheme-7.5/7.5.17/doc-html/scheme_3.html

> Specially recognized keywords divide the formals parameters into these three classes. The keywords used here are `#!optional', `.', and `#!rest'. Note that only `.' is defined by standard Scheme -- the other keywords are MIT Scheme extensions. `#!rest' has the same meaning as `.' in formals

```scheme
(lambda (a #!optional o1 o2 #!rest e)
  ())

(define (print . l)
    (map display l)
    (newline)
    l)
    
; use (apply) to pass rest parameters to another fn
(define (with2More fn)
    (define (with2MoreFn . rest) (+ 2 (apply fn rest)))
	   with2MoreFn)
```
https://riptutorial.com/common-lisp/example/6983/rest-parameter#:~:text=common%2Dlisp%20Functions%20Rest%20Parameter&text=A%20single%20rest%2Dparameter%20can,list%20in%20the%20rest%2Dparameter.

### caveat

a
(#!rest a)

> These two examples are equivalent. a is a rest parameter. The procedure may be passed any number of arguments. Note: this is the only case in which ‘.’ cannot be used in place of ‘#!rest’.
