# Define-IO-loop-let

## define

http://www.shido.info/lisp/scheme4_e.html

### define variable

`(define vhello "Hello world")`

### define function

```lisp
(define fhello
  (lambda ()
	"Hello world"))
```

```lisp
(define hello
  (lambda (name)
    (string-append "Hello " name "!")))
```

#### short-hand, “procedure define"

`(define (hello) "hello world")`

```lisp
(define (hello name)
    (string-append "Hello " name "!"))
```

### Load function

```lisp
(cd "./dir")

(load "hello.scm")
```

## IO

`(open-input-file FILE_NAME)` returns an input port `(let ((p (open-input-file file-name)))`

1. `(read-char PORT)` read a character from the port
2. `(read-line PORT)` read a character from the port
3. `eof-object` is checked by `(eof-object? OBJ)`

`(close-input-port PORT)`

### Sugar

`call-with-input-file` passing port as an argument to lambda, requiring `close-input-port`

```lisp
(call-with-input-file file-name
    (lambda (p)
      (begin
        (display (read-line p))
        (close-input-port p)))))
```

`with-input-from-file` set port as `current-input-port` to lambda (thunk), **NOT** requiring `close-input-port`

> the new port is made to be the value returned by current-input-port or current-output-port (as used by (read), (write obj), and so forth). The _thunk_ is then called with no arguments.

```lisp
(with-input-from-file FILE_NAME
  (lambda ()
    (display (read-line))))
```

## Let

`let` is a syntax sugar of `lambda`, which is basically a IIFT in Javascript, which can achieve block scope variable (Local Variables).

```lisp
(let ((p1 v1) (p2 v2) ...) exp1 exp2 ...)
⇒
((lambda (p1 p2 ...)
    exp1 exp2 ...) v1 v2)
```

`let*` is a syntax sugar for nested let, variable list can refer prior one in order.

## Loop

### Named let

It is basically a tail recursion.

1. **name** name of the loop/function/lambda
2. **binds** list of variable with initial value
3. **body** to execute, contains
   a. **predicate** (condition to exit) and return value
   b. **procedure** which call `name` with next values

```lisp
(let name ((variable init) ...)
  expression
  expression ...)
```

```lisp
(let loop ((v1 0))
  (if (< 2 v1)
    v1
    (begin
      (display "Less than 2")
      (newline)
      (loop (+ v1 1)))))
```

### letrec

```lisp
((letrec ((name
  (named-lambda (name variable ...)
    expression
    expression ...)))
  name)
init ...)
```

### do

1. **binds** list of variable with
   a. initial value
   b. expresion for next value
2. **predicate** (condition to exit) and return value
3. **body** to execute

```lisp
(do binds (predicate value)
    body)

(do ((v1 1 (+ v1 1)))
  ((< 2 v1) v1)
  (display "Less than 2")
  (newline))
```
