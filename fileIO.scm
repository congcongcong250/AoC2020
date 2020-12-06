(define (read-file file-name)
  ; open-input-file returns an input port
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
	  (begin
	    (close-input-port p)
	    (list->string (reverse ls1)))
	  (loop (cons c ls1) (read-char p))))))

(define (read-lines file-name)
  (with-input-from-file file-name 
    (lambda ()
      (let loop((res '()) (c (read-line)))
        (if (eof-object? c) 
          (reverse res)
          (loop (cons c res) (read-line)))))))

