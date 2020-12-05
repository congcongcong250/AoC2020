(define (read-file file-name)
  ; open-input-file returns an input port
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
	  (begin
	    (close-input-port p)
	    (list->string (reverse ls1)))
	  (loop (cons c ls1) (read-char p))))))

(define read-lines
  ; define function with lambda
  (lambda (file-name)
    ; open-input-file returns an input port
    (let ((p (open-input-file file-name)) (res '()))
      (do ((c (read-line p) (read-line p)))
        ((eof-object? c) 
          (begin
            (close-input-port p)
            (reverse res)))
        (set! res (cons c res))))))

