;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designrecipe) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; String -> String
; extracts the first character from a non-empty string
; given: "hello", expect: "h"
; given: "", expect: ""
(define (string-first s)
  (if(string=? s "") "" (string-ith s 0)))


; String -> String
; extracts the last character from a non-empty string
; given: "hello", expect: "o"
; given: "", expect: ""
(define (string-last s)
  (if(string=? s "")
     ""
     (string-ith s (- (string-length s) 1))
     ))


; Image -> Number
; counts the number of pixels in a given image
; given: (circle 10 10 "blue", expect: 400
(define (image-area m)
  (* (image-width m) (image-height m)))


; String -> String
; produces a string like the given one with the first character removed
; given: "hello", expect: "ello"
(define (string-rect s)
  (substring s 1))


; String -> String
; produces s string like the given one with the last character removed
; given: "hello", expect: "hell"
(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))



; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))