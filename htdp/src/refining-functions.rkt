;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname refining-functions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define L (create-dir "/home/dipper/Workspace/htdp"))

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
     (h-d (dir-dirs dr))
     (h-f (dir-files dr)))))

;(how-many.v3 L)


; Exercise 339
; Dir string -> Number
; whether file occurs in the directory tree

(check-expect (find? L "wage") #true)
(check-expect (find? L "free") #false)

(define (find? dr s)
  (local ((define (find-dir d)
            (cond
              [(empty? d) #false]
              [else (or (find? (first d) s) (find-dir (rest d)))]))
          (define (find-file f)
            (cond
              [(empty? f) #false]
              [else (or
                     (string=? (file-name (first f)) s)
                     (find-file (rest f)))])))
    (or (find-file (dir-files dr)) (find-dir (dir-dirs dr)))))


; Exercise 340
; list all files and directories
(define (ls dr)
  (append (map (lambda (s)  (file-name s))
               (dir-files dr))
          (map (lambda (s) (dir-name s))
               (dir-dirs dr))))

; Exercise 342
(define-struct dir.v3 [name dirs files])
(define-struct file* [name size content])
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

; A Path is [List-of String].
; interpretation directions into a directory tree

(check-expect (find L "wage") '("htdp" "wage"))

(define (find dr s)
  (local ((define (path d)
            (list (dir-name d)
                  (if (contain? (dir-files d))
                      (find-f (dir-files d))
                      (path (dir-dirs d)))))
          (define (contain? f)
            (cond
              [(empty? f) #false]
              [else (or (string=? (file-name (first f)) s) (contain? (rest f)))]))
          (define (find-f f)
            (cond
              [(empty? f) '()]
              [else (if (string=? (file-name (first f)) s)
                        s
                        (find-f (rest f)))])))
    (if (find? dr s)
        (path dr)
      #false)))

