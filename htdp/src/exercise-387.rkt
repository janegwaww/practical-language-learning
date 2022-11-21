;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-387) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))

;    ('() '(a b)) '(a b)
;    ('(a b) '(a b)) ('(a) '(a b)) ('() '(a b)) ('(a b))


; [List-of String][List-of Number] -> [List-of '(String Number)]
; produces all possible ordered pairs of symbols and numbers
(check-expect (cross '(a b c) '(1 2)) '((a 1) (a 2) (b 1) (b 2) (c 1) (c 2)))

(define (cross s n)
  (local ((define (cross-n s n)
            (cond
              [(empty? n) '()]
              [else (cons (cons s
                                (cons (first n) '()))
                          (cross-n s (rest n)))])))
    (cond
      [(empty? s) '()]
      [else (append (cross-n (first s) n) (cross (rest s) n))])))