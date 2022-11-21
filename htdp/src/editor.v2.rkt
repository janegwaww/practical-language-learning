;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define CHAR-LIMIT 18)

(define-struct editor [str index])
; An Editor is a structure:
;   (make-editor String Number)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

; Editor -> Image
; consumes an Editor and produces an image
(check-expect (render (make-editor "hello world" 6))
              (overlay/align "left" "center"
                             (beside
                              (text "hello " 11 "black")
                              (rectangle 1 11 "solid" "red")
                              (text "world" 11 "black"))
                             (empty-scene 100 20)))

(define (render ed)
  (overlay/align "left" "center"
               (beside
                (text (substring (editor-str ed) 0 (editor-index ed)) 11 "black")
                (rectangle 1 11 "solid" "red")
                (text (substring (editor-str ed) (editor-index ed) (string-length (editor-str ed))) 11 "black"))
               (empty-scene 100 20)))

; Editor KeyEvent -> Editor
; consumes two inputs, an editor ed and a
; keyevent ke produces another editor
#|(check-expect (edit (make-editor "hello " "world") "a") (make-editor "hello a" "world"))
(check-expect (edit (make-editor "hello " "world") "\b") (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello " "world")  "left") (make-editor "hello" " world"))
(check-expect (edit (make-editor "hello " "world")  "right") (make-editor "hello w" "orld"))
(check-expect (edit (make-editor "" "hello world") "left") (make-editor "" "hello world"))
(check-expect (edit (make-editor "hello world" "") "right") (make-editor "hello world" ""))
(check-expect (edit (make-editor "" "hello world") "\b") (make-editor "" "hello world"))
(check-expect (edit (make-editor "hello " "worldaaaaaaa") "a") (make-editor "hello " "worldaaaaaaa"))
(check-expect (edit (make-editor "hello " "world") "a") (make-editor "hello a" "world"))
(check-expect (edit (make-editor "hello " "world") "a") (make-editor "hello a" "world"))
              
(define (edit ed ke)
  (cond
    [(string=? ke "\b") (delete ed)]
    [(string=? ke "left") (move-left ed)]
    [(string=? ke "right") (move-right ed)]
    [else (char-append ke ed)]
    ))

; Editor -> Editor
; deletes the character immediately to the left of the cursor
(define (delete ed)
  (if(string=? (editor-pre ed) "")
     ed
     (make-editor
      (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1))
      (editor-post ed))))

; Editor -> Editor
; move cursor left
(define (move-left ed)
  (if(string=? (editor-pre ed) "")
     ed
     (make-editor
      (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1))
      (string-append
       (substring (editor-pre ed) (- (string-length (editor-pre ed)) 1))
       (editor-post ed)))))
; Editor -> Editor
; move cursor right
(define (move-right ed)
  (if(string=? (editor-post ed) "")
     ed
     (make-editor
      (string-append (editor-pre ed) (substring (editor-post ed) 0 1))
      (substring (editor-post ed) 1))))

; Editor -> Editor
; append charactor
(define (char-append ke ed)
  (if(= (string-length (string-append (editor-pre ed) (editor-post ed))) CHAR-LIMIT)
     ed
     (make-editor
      (string-append (editor-pre ed) ke)
      (editor-post ed))))

; launches an interactive editor
(define (run ed)
  (big-bang ed
            [on-key edit]
            [to-draw render]))
|#

