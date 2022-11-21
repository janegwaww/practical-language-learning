;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname x-expression) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; An Xexpr.v3 is a list: 
; – (cons Symbol Body)
; – (cons Symbol (cons [List-of Attribute] Body))
; - (cons Symbol (cons [List-of Attribute]))
; - (cons Body)
; - (cons Symbol)
; where Body is short for [List-of Xexpr.v2]
; An Attribute is a list of two items:
;   (cons Symbol (cons String '()))

'(transition ((from "seen-e") (to "seen-f")))
'(ul (li (word))
     (li (word)))


#|<server name="example.org"></server>
<carcas><board><grass /></board><player name="sam"></player></carcas>
<start></start>|#

(define a0 '((initial "X")))
 
(define e0 '(machine))
(define e1 `(machine ,a0))
(define e2 '(machine (action)))
(define e3 '(machine () (action)))
(define e4 `(machine ,a0 (action) (action)))

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

; [List-of Attribute] or Xexpr.v2 -> Boolean
; is x a list of attributes
(define (list-of-attributes? x)
  (cond
    [(empty? x) #true]
    [else
     (local ((define possible-attribute (first x)))
       (cons? possible-attribute))]))

; Exercise 366
; Xexpr.v2 -> Symbol
; extracts the tag of the element representation
(check-expect (xexpr-name e0) 'machine)

(define (xexpr-name ex)
  (first ex))

; Exercise 366
; Xexpr.v2 -> [list-of elements]
; extracts the list of content elements
(check-expect (xexpr-content e0) '())
(check-expect (xexpr-content e2) '((action)))
(check-expect (xexpr-content e4) '((action) (action)))

(define (xexpr-content ex)
  (local ((define content (rest ex)))
    (cond
    [(empty? content) '()]
    [else (local
            ((define loa-or-x (first content)))
            (if (list-of-attributes? loa-or-x)
                (rest content)
                content))])))

; Exercise 367
; because base on iterate refinement,
; we improve the solution as iterate test.

; Exercise 368
; [X][List-of X] -> Boolean

; Exercise 369
; retrieves the string associates the symbol if exist
(check-expect (find-attr (xexpr-attr e1) 'initial) "X") 

(define (find-attr loa sy)
  (local ((define attr (assq sy loa)))
    (if (cons? attr)
        (second attr)
        #false)))

; Exercise 370
; Xword -> Boolean
; whether some ISL+ value is in XWord
(check-expect (word? '(word ((text "text")))) #true)

(define (word? xw)
  (symbol=? (first xw) 'word))

; Exercise 371
; Xword -> String
; extracts the value of the only
; attribute of an instance of XWord
(check-expect (word-text '(word ((text "text")))) "text")

(define (word-text xw)
  (find-attr (xexpr-attr xw) 'text))

(define BT (circle 5 "solid" "black"))
(define e5
  '(ul
    (li (word ((text "one"))))
    (li (word ((text "two"))))))
; XItem.v1 -> Image 
; renders an item as a "word" prefixed by a bullet
(define (render-item1 i)
  (local ((define content (xexpr-content i))
          (define element (first content))
          (define a-word (word-text element))
          (define item (text a-word 12 'black)))
    (beside/align 'center BT item)))