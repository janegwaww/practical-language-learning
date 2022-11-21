;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; SIGS Image -> Image
; render tank
(define (tank-render t im)
  (overlay/xy t im))

; SIGS Image -> Image
; render ufo
(define (ufo-render u im)
  (overlay/xy u im))

; SIGS Image -> Image
; render missile
(define (missile-render m im)
  (overlay/xy m im))

; SIGS -> Boolean
; game stops if the UFO lands or if the missile hits the UFO
(define (si-game-over s)
  (or
   (<= ufo 0)
   (< missile ufo)))

; SIGS -> Image
; render the final state of the game
(define (si-render-final s)
  s)

; SIGS -> SIGS
; determine to which position the objects move
(define (si-move s)
  (cond
    [(aim? s) ufo]
    [(fire? s) missile]))

; SIGS KeyEvent -> SIGS
; key-event handler
(define (si-control s ke)
  (cond
    [(string=? ke "left") move]
    [(string=? ke "right") move]
    [(string=? ke " ") missile-lanch]
    [else s]))

; SIGS -> Image
; renders the given game state on top of BACKGROUND 
; for examples see figure 36
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render
       (fired-tank s)
       (ufo-render (fired-ufo s)
                   (missile-render (fired-missile s)
                                   BACKGROUND)))]))