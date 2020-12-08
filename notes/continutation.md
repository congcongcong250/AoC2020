# Continuation

http://www.shido.info/lisp/scheme_cc_e.html

Interesting enough, scheme (lisp) does not support `return` syntax, tho it provide a hatch called `call-with-current-continuation` or `call/cc`;

## Basics

`(* 3 (call/cc (lambda (k) (+ 1 2))))` ⇒ 9

`(* 3 (call/cc (lambda (k) (+ 1 (k 2)))))` ⇒ 6
