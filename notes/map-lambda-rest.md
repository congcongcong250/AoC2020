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

## lambda rest

https://groups.csail.mit.edu/mac/ftpdir/scheme-7.5/7.5.17/doc-html/scheme_3.html

> Specially recognized keywords divide the formals parameters into these three classes. The keywords used here are `#!optional', `.', and `#!rest'. Note that only `.' is defined by standard Scheme -- the other keywords are MIT Scheme extensions. `#!rest' has the same meaning as `.' in formals

```scheme
(lambda (a #!optional o1 o2 #!rest e)
  ())

(define (log . l)
    (map display l)
    (newline)
    l)
```
