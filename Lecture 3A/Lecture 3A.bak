#lang planet neil/sicp

;;;Suppose we want to do arithmetic with rational numbers.
; Let's assume (method of 'wishful thinking') that we have some methods make-rat, numer, and denom.
; How could we implement rational arithmetic?
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


;;;How can we implement these procedures make-rat, numer, and denom?

;;;;;;;;;;;;;;;;;;Definition;;;;;;;;;;;;;;;
;;;(cons x y)
;      constructs a pair whose first part
;      is x and whose second part is y
;;;(car p)
;       selects the first part of the pair p
;;;(cdr p)
;      selects the second part of the pair p
;
;;;(car (cons x y)) == x
;;;(cdr (cons x y)) == y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;Representing rational numbers
#;(define (make-rat n d)
  (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

#;(define (print-rat x) 
    (display (string-append (numer x) "/" (denom x))))

;example 1/2 + 1/4
;(define A (make-rat-first-try 1 2))
;(define B (make-rat-first-try 1 4))
;(define ans (add-rat A B))
;(numer ans) ;;6
;(denom ans) ;;8

;;; 6/8 not 3/4!  Let's improve make-rat.
(define (make-rat n d) 
  (let ((g (gcd n d)))
    (cons (/ n g)
          (/ d g))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Now we can apply our methods compute 1/2 + 1/4 as desired.
(define x (make-rat 1 2))
(define y (make-rat 1 4))
(define ans (add-rat x y))
(numer ans) ;3
(denom ans) ;4

;;;By the way, cons car and cdr are pure abstraction!
;After all, mathematically a pair is just a mapping (function, procedure) from {1,2} 
;into the coordinates of the pair.
#; (define (cons a b)
     (lambda (pick)
       (cond ((= pick 1) a)
             ((= pick 2) b))))
#; (define (car x) (x 1))
#; (define (cdr x) (x 2))


