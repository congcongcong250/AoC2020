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

#### short-hand

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
