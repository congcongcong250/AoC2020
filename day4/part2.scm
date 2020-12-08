
; This attempt uses:
;   - `(if)` s not very easy to use since there are not explicit `return` semantic in scheme
;   - `(null?)` null check is a annoying anywhere
;   - `(char<=?)` to compare char
;     - `(string->list)` turns string to list of char

(load "../fileIO.scm")
(load "../util.scm")

(define lines (read-lines "input.txt"))
(define passports '())
(define cur (make-equal-hash-table))

(define valid-count 0)

(define (check-range value min max)
  (if (or (string? value) (number? value))
    (let* ((nb (if (string? value) (string->number value) value))) 
      (if (number? nb)
        (and (>= nb min) (<= nb max))
        #f))
    #f))

(define (check-byr byr)
  (check-range byr 1920 2002))

(define (check-iyr iyr)
  (check-range iyr 2010 2020))

(define (check-eyr eyr)
  (check-range eyr 2010 2030))

(define (check-hgt hgt)
  (let ((lg (string-length hgt))) 
    (if (> lg 2)
      (let* 
        ((unit (substring hgt (- lg 2) lg))
          (nb (substring hgt 0 (- lg 2))))
        (cond 
          ((equal? unit "cm")
            (check-range nb 150 193))
          ((equal? unit "in")
            (check-range nb 59 76))
          (else #f)))
      #f)))

(define (check-hcl hcl)
  (if (eq? (string-length hcl) 7)
    (let* 
        ((she (substring hcl 0 1))
          (hex-v (substring hcl 1 7)))
        (if (equal? she "#")
          (if (eq? 0 
            (length 
              (filter 
                (lambda (x) 
                  (not 
                    (or
                      (and (char<=? #\0 x) (char<=? x #\9))
                      (and (char<=? #\a x) (char<=? x #\f)))))
                (string->list hex-v))))
            #t #f)
          #f))
    #f))

(define (check-ecl ecl)
  (cond 
    ((equal? ecl "amb") #t)
    ((equal? ecl "blu") #t)
    ((equal? ecl "brn") #t)
    ((equal? ecl "gry") #t)
    ((equal? ecl "grn") #t)
    ((equal? ecl "hzl") #t)
    ((equal? ecl "oth") #t)
    (else #f)))

(define (check-pid pid)
  (if (and 
    (eq? 9 (string-length pid))
    (string->number pid))
  #t #f))

(define (check-pspt pspt)
  (let* ((keys (list "byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid")) (valid #t))
    (for-each
      (lambda (key)
        (let ((value (hash-table/get cur key '())))
          (cond
            ((null? value) 
              (set! valid #f))
            ((equal? key "byr") 
              (set! valid (if valid (check-byr value) #f)))
            ((equal? key "iyr") 
              (set! valid (if valid (check-iyr value) #f)))
            ((equal? key "eyr") 
              (set! valid (if valid (check-eyr value) #f)))
            ((equal? key "hgt") 
              (set! valid (if valid (check-hgt value) #f)))
            ((equal? key "hcl") 
              (set! valid (if valid (check-hcl value) #f)))
            ((equal? key "ecl") 
              (set! valid (if valid (check-ecl value) #f)))
            ((equal? key "pid") 
              (set! valid (if valid (check-pid value) #f))))))
    keys)
  valid))

(for-each
  (lambda (line)
    (if (not (eq? 0 (string-length line)))
        (for-each 
          (lambda (pair) 
            (hash-table/put! cur (first pair) (second pair))) 
          (map
            (string-splitter 'delimiter #\:)
            ((string-splitter) line)))
        (begin 
          (if (check-pspt cur)
            (set! valid-count (+ valid-count 1)))
          (set! passports (cons cur passports))
          (set! cur (make-equal-hash-table)))))
lines)

(if (check-pspt cur)
  (set! valid-count (+ valid-count 1)))
(set! passports (cons cur passports))
    
(define res valid-count)

(if (null? res)
  (print "No result")
  (print "Result is " res))