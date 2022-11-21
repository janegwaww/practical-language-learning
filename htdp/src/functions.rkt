;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (cvolume x) (* x x x))
(define (csurface x) (* x x 6))

(define (string-first s) (string-ith s 0))
(define (string-last s) (string-ith s (- (string-length s) 1)))

(define (==> s f) (or s f))

(define (image-area i) (* (image-height i) (image-width i)))

(define (string-join s1 s2) (string-append s1 "_" s2))
(string-join "hello" "world")
