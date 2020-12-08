# Common errors

#### `Definition may not be used as an expression: #[defn-item 22 x #[expr-item 23]]`

In expression like `(display (define x 10))`, `define` is supposed to be used as global definition, instead of expression in code.

#### `;Unbound variable: x`

Pretty obvious.

#### `;Unspecified return value`

This is fine.
