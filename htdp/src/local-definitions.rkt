;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname local-definitions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; [X] [X -> Number] [NEList-of X] -> X 
; finds the (first) item in lx that maximizes f
; if (argmax f (list x-1 ... x-n)) == x-i, 
; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
#|(define (argmax f lx) ...)

(check-expect (argmax sqrt '(1 3 2 4 8 4 18)) 8)


(define (listing l)
  (cond
    [(empty? l) ""]
    [(string-append
      (sort (map f l)))]))|#

; [X][list-of X][X -> X] -> [list-of X]
; build list works like build-list
; (build-l*st x f) == (list (f x-1) ... (f x-n))
(define (build-l*st n f)
  (cond
    [(<= n 0) '()]
    [else (add-at-end
           (build-l*st (- n 1) f)
           n)]))

(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l) (add-at-end (rest l) s))]))


; a plain background image 
(define MT (empty-scene 50 50))

(define triangle-p
  (list
    (make-posn 20 10)
    (make-posn 20 20)
    (make-posn 30 20)))

; Image Polygon -> Image 
; adds an image of p to MT
(define (render-poly img p)
  (local (
          ; Polygon -> Posn
          ; extracts the last item from p
          (define (last p)
            (cond
              [(empty? (rest (rest (rest p)))) (third p)]
              [else (last (rest p))]))
          
          ; Image NELoP -> Image
          ; connects the Posns in p in an image
          (define (connect-dots img p)
            (cond
              [(empty? (rest p)) MT]
              [else (render-line (connect-dots img (rest p))
                                 (first p)
                                 (second p))]))
          ; Image Posn Posn -> Image 
          ; draws a red line from Posn p to Posn q into im
          (define (render-line im p q)
            (scene+line
             im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red")))
  (render-line (connect-dots img p) (first p) (last p))))
 

; Exercise 261
; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
#|(define (extract1 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (local ((define extract-rest (extract1 (rest an-inv))))
      (cond
       [(<= (ir-price (first an-inv)) 1.0)
        (cons (first an-inv) extract-rest)]
       [else extract-rest]))]))|#


; [x] x -> [list-of x]
; creates diagonal squares of 0s and 1s
(define (identityM n)
  (local ((define (list-n k j)
            (local ((define (bh m) (if (= k (add1 m)) 1 0)))
              (cond
                [(<= k 0) '()]
                [else 
                 (cons (build-list j bh) (list-n (sub1 k) j))]))))
    (list-n n n)))
(identityM 3)