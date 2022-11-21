;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname wage) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define wh 18)

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(check-expect (wage* (cons 2 (cons 10 '()))) (cons 36 (cons 180 '())))
(check-expect (wage* (cons 110 '())) (error "no exceeds 100"))

(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cond
            [(> (first whrs) 100) (error "no exceeds 100")]
            [else (cons (wage (first whrs)) (wage* (rest whrs)))])]))
 
; Number -> Number
; computes the wage for h hours of work
(check-expect (wage 2) 36) 

(define (wage h)
  (* wh h))