;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname refining-data-definitions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define dir-root '(resd! (part! part2) ((hang draw) (!read))))

; Dir.v1 -> Number
; count files from a dir

(check-expect (how-many dir-root) 6)

(define (how-many dir)
  (cond
    [(empty? dir) 0]
    [(symbol? dir) 1]
    [else (+ (how-many (first dir)) (how-many (rest dir)))]))


(define-struct dir.v1 [name content])
;(make-dir String LOFD)

(define root (make-dir.v1 "root"
                       (list "read1"
                             (make-dir.v1 "Text" (list "part1" "part2" "part3"))
                             (make-dir.v1 "Libs" (list (make-dir.v1 "Code" (list "hang" "draw"))
                                                       (make-dir.v1 "Docs" (list "read!")))))))

; Dir.v2 -> Number
; how many files a dir contains

;(check-expect (how-many.v2 root) 6)

(define (how-many.v2 md)
 (ml (dir.v1-content md)))

(define (ml l)
  (cond
    [(empty? l) 0]
    [(dir? (first l)) (how-many.v2 (first l))]
    [else  (+ 1 (ml (rest l)))]))



(define-struct file* [name size content])
(define-struct dir.v3 [name dirs files])
    
(define root* (make-dir.v3 "root"
                           (list (make-dir.v3 "Text" '() (list
                                                       (make-file* "part1" 99 "part1")
                                                       (make-file* "part2" 52 "part2")
                                                       (make-file* "part3" 17 "part3")))
                                 (make-dir.v3 "Libs" (list
                                                      (make-dir.v3 "Code" '()
                                                                   (list (make-file* "hang" 8 "hang")
                                                                         (make-file* "draw" 2 "draw")))
                                                      (make-dir.v3 "Docs" '()
                                                                   (list (make-file* "read!" 19 "read!"))))
                                              '()))
                           (list (make-file* "read" 10 "read"))))

; Dir.v3 -> Number
; how many files dir contains
(check-expect (how-many.v3 root*) 7)

(define (how-many.v3 dr)
  (local ((define (h-f f)
            (cond
              [(empty? f) 0]
              [else (+ 1 (h-f (rest f)))]))
          (define (h-d d)
            (cond
              [(empty? d) 0]
              [else (+ (how-many.v3 (first d)) (h-d (rest d)))])))
    (+
     (h-d (dir.v3-dirs dr))
     (h-f (dir.v3-files dr)))))



