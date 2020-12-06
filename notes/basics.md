# Basics

## General

- `brew install mit-sheme`, `brew install rlwrap`, `rlwrap scheme`
- So it seems "Formulas consisting of parentheses, tokens, and separators are called **S-expressions**."

## Calculation

http://www.shido.info/lisp/scheme2_e.html

`(+ 1 2 3 4)` → 10

`(- 10 3)` → 7

`(- 10 3 5)` → 2

`(* 2 3)` → 6

`(* 2 3 4)` → 24

`(/ 29 3)` → 29/3

`(/ 29 3 7)` → 29/21

`(exact->inexact (/ 29 3 7))` → 1.380952380952381

`quotient`, `remainder`, `modulo`, `sqrt`

## Cons Cells and Lists

http://www.shido.info/lisp/scheme3_e.html

Con cell = car + cdr (current value + next value)

`(cons 1 (cons 2 3))` -> (1 2 .3)

`(cons 1 (cons 2 (cons 3 '())))` -> (1 2 3) as a list

`#\a` is character 'a'

`(list 1 2 3)` -> (1 2 3)

### Atoms

> Data structures which do not use cons cells are called atom. Numbers, characters, strings, vectors, and '() are atom. '() is an atom and a list as well.

### quote or `'`

`(quote (+ 2 3))` or `'(+ 2 3)` represents a list (+ 2 3) itself.

`(quote ())` or `'()` represents an empty list.

`'(1 2 3)` or `(list 1 2 3)` -> (1 2 3)

`'((1 2) (3 4))` or `(list '(1 2) '(3 4))` or `(list (list 1 2) (list 3 4))` -> ((1 2) (3 4))

**Tip:** `'('(1 2) '(3 4))` is `((quote (1 2)) (quote (3 4)))`
