;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-437) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Exercise 437
#|(define (general P)
  (cond
    [(trivial? P) (solve P)]
    [else
     (combine-solutions
       P
       (general
         (generate P)))]))|#

; special computes the length of its input,
(define (special P)
  (cond
    [(empty? P) 0]
    [else
     (+
       1
       (special (rest P)))]))

; special negates each number on the given list of numbers, and
(define (special.v2 P)
  (cond
    [(empty? P) '()]
    [else
     (cons
       (- (first P))
       (special.v2 (rest P)))]))

; special uppercases the given list of strings.
(define (special.v3 P)
  (cond
    [(empty? P) ""]
    [else
     (cons
       (+ (first P))
       (special.v3 (rest P)))]))