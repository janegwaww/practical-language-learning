;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tl-next) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (tl-next 0) 2)
(check-expect (tl-next 1) 1)
(check-expect (tl-next 2) 0)
(define (tl-next-numeric s)
  (module (+ x 1) 3))
  
; simulates a traffic light for a given duration
(define (traffic-light x)
  (big-bang x
    [on-tick tl-next]
    [to-draw tl-render]
    ))

; render light image
(define (tl-render color)
  (circle 40 40 color))