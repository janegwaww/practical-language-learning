;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname simultaneously) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Exercise 388
(define-struct employee [name ssn rate])
(define-struct record* [name hour])
(define-struct wage [name wage])

; [List-of Number] [List-of Number] -> [List-of Number]
; multiplies the corresponding items on 
; hours and wages/h 
; assume the two lists are of equal length

(check-expect (wages*.v3 '() '()) '())
(check-expect (wages*.v3 (list (make-employee "a" 111 5.65)) (list (make-record* "a" 40)))
              (list (make-wage "a" 226.0)))
(check-expect (wages*.v3 (list (make-employee "a" 111 5.65) (make-employee "b" 222 8.75))
                         (list (make-record* "a" 40.0) (make-record* "b" 30.0)))
              (list (make-wage "a" 226.0) (make-wage "b" 262.5)))

(define (wages*.v3 hours wages/h)
  (cond
    [(empty? hours) '()]
    [else
     (cons
       (make-wage (employee-name (first hours))
                  (weekly-wage (employee-rate (first hours))
                               (record*-hour (first wages/h))))
       (wages*.v3 (rest hours) (rest wages/h)))]))

; Number Number -> Number
; computes the weekly wage from pay-rate and hours
(define (weekly-wage pay-rate hours)
  (* pay-rate hours))


; Exercise 389
(define-struct phone-record [name number])
; A PhoneRecord is a structure:
;   (make-phone-record String String)
    
; [list-of String][List-of String] -> [List-of [String String])
; combines those equally long lists into a list of phone records
(check-expect (zip '("a" "b") '("111" "222"))
              (list (make-phone-record "a" "111")
                    (make-phone-record "b" "222")))

(define (zip n p)
  (cond
    [(empty? n) '()]
    [else (cons
           (make-phone-record (first n) (first p))
           (zip (rest n) (rest p)))]))