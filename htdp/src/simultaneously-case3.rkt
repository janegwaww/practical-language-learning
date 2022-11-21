;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname simultaneously-case3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; N is one of: 
; – 0
; – (add1 N)

; [List-of Symbol] N -> Symbol
; extracts the nth symbol from l; 
; signals an error if there is no such symbol
(check-error (list-pick '() 0) "list too short")
(check-expect (list-pick (cons 'a '()) 0) 'a)
(check-error (list-pick '() 3) "list too short")

(define (list-pick l n)
  'a)



; Exercise 390

(define-struct branch [left right])
; A TOS is one of:
; – Symbol
; – (make-branch TOS TOS)

; A Direction is one of:
; – 'left
; – 'right

; TOS [List-of Direc] -> TOS
; produces TOS base on directions

(check-expect (tree-pick (make-branch 'a (make-branch 'b 'c)) '(right left)) 'b)
(check-expect (tree-pick.v2 (make-branch 'a (make-branch 'b 'c)) '(right left)) 'b)

(define (tree-pick tos d)
  (cond
    [(and (symbol? tos) (empty? d)) tos]
    [(and (symbol? tos) (cons d)) (error "directions error")]
    [(and (not (branch? tos)) (empty? d)) (error "error")]
    [(and (not (branch? tos)) (cons? d)) (error "not a branch structure")]
    [(and (branch? tos) (empty? d)) tos]
    [(and (branch? tos) (cons? d))
     (tree-pick (cond
                  [(symbol=? (first d) 'left) (branch-left tos)]
                  [(symbol=? (first d) 'right) (branch-right tos)])
                (rest d))]))

(define (tree-pick.v2 tos d)
  (cond
    [(and (symbol? tos) (cons? d)) (error "directions error")]
    [(and (or (symbol? tos) (branch? tos))
          (empty? d)) tos]
    [(and (branch? tos) (cons? d))
     (tree-pick (cond
                  [(symbol=? (first d) 'left) (branch-left tos)]
                  [(symbol=? (first d) 'right) (branch-right tos)])
                (rest d))]))

