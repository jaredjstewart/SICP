#lang planet neil/sicp

;;;;;;;Representing vectors as pairs;;;;;;;
(define make-vector cons)
(define xcor car)
(define ycor cdr)
;Adding vectors
(define (+vect v1 v2)
  (make-vector
   (+ (xcor v1) (xcor v2))
   (+ (ycor v1) (ycor v2))))
;Scaling vectors
(define (scale s v)
  (make-vector (* s (xcor v))
               (* s (ycor v))))

;;;;;;Representing line segments;;;;;;;;;;
(define make-seg cons)
(define seg-start car)
(define seg-end cdr)

(make-seg (make-vector 2 3)
          (make-vector 5 1))

;How about representing lists/sequences?;;;;;;;;;;;;;
;List as nested pairs:
(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))
;Fortunately LISP gives us syntactic sugar for lists.
(define 1-to-4 (list 1 2 3 4))

(define (getAt xs n)
  (if (= n 0)
      (car xs)
      (getAt (cdr xs) (- n 1))))

(getAt 1-to-4 0)
(getAt 1-to-4 3)

;What if we'd like to implement the following?
;(scale-list 10 1-to-4) -> (10 20 30 40)
(define (scale-list-first-try s l)
  (if (null? l)
      nil
      (cons ( * (car l) s)
            (scale-list-first-try s (cdr l)))))

(scale-list-first-try 10 1-to-4)
;But this will result in repeating the cdr navigation of a list every time we'd like to transform one!
;Instead, we should define a higher-order procedure:

;;;;;;;;;;;;;;;;; Map ;;;;;;;;;;;;;;;;;;;;;;;;;
(define (map p l) ;apply p to the list l
  (if (null? l)
      nil
      (cons (p (car l))  ;apply p to the first element
            (map p (cdr l))))) ;map down the rest of the list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;and now we can implement an improved scale-list.
(define (scale-list s l)
  (map (lambda (item) (* item s) )
       l))
(scale-list 10 1-to-4)
;The cdr-navigation of the list structure is abstracted away from the user!
#; (map square 1-to-4) ;; -> (1 4 9 16)
#; (map (lambda (x) (+ x 10)) 1-to-4) ;; -> (11 12 13 14)

;Another useful list method is for-each:

;;;;;;;;;;;;;; For-each ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc
                        (cdr list)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(for-each display 1-to-4)


