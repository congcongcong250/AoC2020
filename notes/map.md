# hashMap

- `'()` is used as null in lisp
- use `map` and `display` to display concatenated strings and numbers

```lisp
(map display
 (list "Rolling " (- 5 (length my-rolled-dice))
       " dice\nYou rolled\n" my-roll "\n"))
```

## Create

`create-eq-hash-table`
`create-eqv-hash-table`
`create-equal-hash-table`
`create-string-hash-table`

## Manipulate

`hash-table/put!`
`hash-table/get`
`hash-table->alist`
