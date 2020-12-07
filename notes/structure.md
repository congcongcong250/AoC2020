# Structure

http://www.shido.info/lisp/scheme_vec_e.html

## define

`(define-structure book title authors publisher year isbn)`

- `(make-book 1 2 3 4 5 6)`
- `book?`
- `book-title`, `book-authors`, `book-publisher`, etc
- `set-book-year!`, `set-book-isbn!`, etc

`define-structure (book keyword-constructor copier) title authors publisher year isbn)`

- keyword-constructor: `(make-book 'book 1 'title 2 ...)`
- copier: `copy-book`
