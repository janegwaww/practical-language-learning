;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list-in-list) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define ls '())
(define lls (cons ls '()))

; An LN is one of: 
; – '()
; – (cons Los LN)
; interpretation a list of lines, each is a list of Strings
 
(define line0 (cons "hello" (cons "world" '())))
(define line1 '())
 
(define ln0 '())
(define ln1 (cons line0 (cons line1 '())))
 
; LN -> List-of-numbers
; determines the number of words on each line 
 
(check-expect (words-on-line ln0) '())
(check-expect (words-on-line ln1) (cons 2 (cons 0 '())))
 
(define (words-on-line ln)
  (cond
    [(empty? ln) '()]
    [else (cons (length (first ln))
                (words-on-line (rest ln)))]))


; String -> String
; converts a list of lines into a string
(check-expect (collapse ln1) "hello world \n\n")

(define (collapse s)
  (cond
    [(empty? s) ""]
    [else (string-append (sp (first s)) "\n" (collapse (rest s)))]))

(define (sp s)
  (cond
    [(empty? s) ""]
    [else (string-append (first s) " " (sp (rest s)))]))

#|(write-file "ttt.dat"
            (collapse (read-words/line "ttt.txt")))|#


; String -> List-of-line
; removes all articles from a text file
(define (no-articles file-name)
  (remove-art (read-words/line file-name)))

; List-of-line -> List-of-line
(define (remove-art f)
  (cond
    [(empty? f) '()]
    [else (cons (line-mv (first f)) (remove-art (rest f)))]))

; line -> line
(define (line-mv l)
  (cond
    [(empty? l) '()]
    [else (if(string=? (first l) "the")
             (line-mv (rest l))
             (cons (first l) (line-mv (rest l)))
             )]))


; 1String -> String
; converts the given 1String to a 3-letter numeric String
 
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t")
              (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a")
              (string-append "0" (code1 "a")))
 
(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))
 
; 1String -> String
; converts the given 1String into a String
 
(check-expect (code1 "z") "122")
 
(define (code1 c)
  (number->string (string->int c)))

; list-of-line -> list-of-line
; encodes text files numerically
(define (encode-f f)
  (cond
    [(empty? f) '()]
    [else (cons (encode-l (first f)) (encode-f (rest f)))]))

(define (encode-l l)
  (cond
    [(empty? l) '()]
    [else (cons (encode-w (explode (first l))) (encode-l (rest l)))]))

(define (encode-w w)
  (cond
    [(empty? w) ""]
    [else (string-append (encode-letter (first w)) (encode-w (rest w)))]))