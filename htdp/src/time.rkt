;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname time) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title director year])
(define (movie-content m)
  (string-append (movie-title m) (movie-director m) (movie-year m)))


(define-struct t [h m s])
; Time -> Seconds
; produces the number of seconds that have passed sine midnight
(check-expect  (time->seconds (make-t 12 30 2)) 45002)
 
(define (time->seconds t)
  (+ (* (t-h t) 60 60) (* (t-m t) 60) (t-s t)))
  