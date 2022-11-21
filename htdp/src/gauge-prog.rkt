;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gauge-prog) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define decrease (- 0.1))
(define max-guage 100)
(define key-down (/ 1 5))
(define key-up (/ 1 3))
(define BG (empty-scene 10 100 "black"))

; Number -> Image
; draw the rectangle base on y coodinate
(define (rec y) (rectangle 10 y "red"))

; happinsee guage
(define (gauge-prog x)
  (big-bang
   [tick tock]
   [arrow-key-down down-arrow]
   [arrow-key-up up-arrow]
   [to-drow render]))

; Number -> Number
; with each clock tick happiness decreases by -0.1
; it never falls beblow 0
(define (tock x)
  (if (<= x 0) x (- x 0.1)))


; Number -> Number
; the down arrow key is pressed decreases by 1/5
(define (down-arrow x) (- x key-down))


; Number -> Number
; the up arrow is pressed jumps by 1/3
(define (up-arrow x) (+ x key-up))


; Number -> Image
; show the level of happiness
; use a scene with a solid, red rectangle with a black frame
(define (render y)
  (place-image (rec y) 5 y BG))