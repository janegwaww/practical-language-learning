;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname abstracting-with-lambda) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(map (lambda (x) (* 10 x))
     '(1 2 3))

(foldl (lambda (name rst)
         (string-append name ", " rst))
       "etc."
       '("Matthew" "Robby"))


(define th 20)
(define-struct ir [name price]) 
(filter (lambda (ir) (<= (ir-price ir) th))
        (list (make-ir "bear" 10)
              (make-ir "doll" 33)))

(define (convert-euro eu)
  (map (lambda (u) (/ u 1.06)) eu))
(convert-euro '(1 3))

(define (convertFC f)
  (map (lambda (i) (* (/ 5 9) (- i 32))) f))

(define (translate l)
  (map (lambda (p) (list (posn-x p) (posn-y p))) l))

(define (sort* l)
  (sort (lambda (s1 s2) (> (ir-price s1) (ir-price s2))) l))

