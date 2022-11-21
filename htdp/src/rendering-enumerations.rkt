;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname rendering-enumerations) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define (xexpr-content ex)
  (local ((define content (rest ex)))
    (cond
    [(empty? content) '()]
    [else (local
            ((define loa-or-x (first content)))
            (if (list-of-attributes? loa-or-x)
                (rest content)
                content))])))
(define (list-of-attributes? x)
  (cond
    [(empty? x) #true]
    [else
     (local ((define possible-attribute (first x)))
       (cons? possible-attribute))]))
(define (word? xw)
  (symbol=? (first xw) 'word))
(define (word-text xw)
  (find-attr (xexpr-attr xw) 'text))
(define (find-attr loa sy)
  (local ((define attr (assq sy loa)))
    (if (cons? attr)
        (second attr)
        #false)))
(define (xexpr-attr xe)
  (local ((define optional-loa+content (rest xe)))
    (cond
      [(empty? optional-loa+content) '()]
      [else
       (local ((define loa-or-x
                 (first optional-loa+content)))
         (if (list-of-attributes? loa-or-x)
             loa-or-x
             '()))])))
(define e0
  '(ul
    (li (word ((text "hello"))))
    (li (word ((text "two"))))))

; An XItem.v2 is one of: 
; – (cons 'li (cons XWord '()))
; – (cons 'li (cons [List-of Attribute] (list XWord)))
; – (cons 'li (cons XEnum.v2 '()))
; – (cons 'li (cons [List-of Attribute] (list XEnum.v2)))
; 
; An XEnum.v2 is one of:
; – (cons 'ul [List-of XItem.v2])
; – (cons 'ul (cons [List-of Attribute] [List-of XItem.v2]))

; Exercise 374
; – (cons 'li (cons XWord '()))
; - (cons 'li (cons (cons attr1 (cons attr2 ...) (cons xw1 (cons xw2 '()))))
; – (cons 'li (cons XEnum.v2 '()))
; – (cons 'li (cons [List-of Attribute] (list XEnum.v2)))
; - (cons 'li (cons (cons attr1 (cons attr2 ...) (cons xe1 (cons xe2 ...))))
; 
; An XEnum.v2 is one of:
; - (cons 'ul (cons xi1 (cons xi2 ...)))
; – (cons 'ul (cons (cons attr1 (cons attr2 ...)) (cons )))
(define (render-enum1 ex)
  (local ((define content (rest ex))
          (define (fb it so-far)
            (above/align 'left (render-item it) so-far)))
    (foldr fb empty-image content)))


(define SIZE 12) ; font size 
(define COLOR "black") ; font color 
(define BT ; a graphical constant 
  (beside (circle 1 'solid 'black) (text " " SIZE COLOR)))

(define e0-rendered
  (above/align
   'left
   (beside/align 'center BT (text "one" 12 'black))
   (beside/align 'center BT (text "two" 12 'black))))

; Image -> Image
; marks item with bullet
(check-expect (bulletize (text "hello" 12 'black))
              (beside/align 'center BT (text "hello" 12 'black)))
(define (bulletize item)
  (beside/align 'center BT item))
 
; XEnum.v2 -> Image
; renders an XEnum.v2 as an image
;(check-expect (render-enum ) )
(check-expect (render-enum e0) e0-rendered)
(define (render-enum xe)
  (local ((define content (xexpr-content xe))
          ; XItem.v2 Image -> Image 
          (define (deal-with-one item so-far)
            (above/align 'left (render-item item) so-far)))
    (foldr deal-with-one empty-image content)))
 
; XItem.v2 -> Image
; renders one XItem.v2 as an image
(check-expect (render-item '(li (word ((text "one")))))
              (beside/align 'center BT (text "one" 12 'black)))
(define (render-item an-item)
  (local ((define content (first (xexpr-content an-item))))
    (bulletize
      (cond
        [(word? content)
         (text (word-text content) SIZE 'black)]
        [else (render-enum content)]))))

; XEnum.v2 -> Number
; counts all "hello"s in an instance of XEnum.v2
(define (count-hello xe)
  (local ((define content (xexpr-content xe))
          (define (count-it it)
            (local ((define content (first (xexpr-content it))))
              (cond
                [(word? content) (if (string=? (word-text content) "hello")
                                     (+ 1 (count-hello content))
                                     (count-hello content))]
                [else (count-hello content)])))
          (define (fb it) (cond
                            [(empty? it) 0]
                            [else (count-it it)])))
    (fb content)))