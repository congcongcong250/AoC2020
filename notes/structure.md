# Structure

http://www.shido.info/lisp/scheme_vec_e.html

## define-structure

### Syntax

`(define-structure (name structure-option . . .) slot-description)`

#### slot-description

- `slot-name`: `title`
- `(slot-name default-init [slot-option value]*)`: `(height 0 read-only #t)`
- slot-option: `read-only`, if set true, no modifier will be defined

#### structure-option

- keyword-constructor: make constructor using (key/symbol value) pair `(make-book 'book 1 'title 2 ...)`
- copier: define a global copier `copy-book`
- etc

### EG

`(define-structure book title authors publisher year isbn)`

- `(make-book 1 2 3 4 5 6)`
- `book?`
- `book-title`, `book-authors`, `book-publisher`, etc
- `set-book-year!`, `set-book-isbn!`, etc

`define-structure (book keyword-constructor copier) title authors publisher year isbn)`
