#lang planet neil/sicp

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger a b) 
  (if (> a b) a b))

(define (sum-of-squares-of-largest-two a b c) 
   (if (= a (larger a b))
       (sum-of-squares a (larger b c))
       (sum-of-squares b (larger a c))))

(sum-of-squares-of-largest-two 3 2 1)
       
       
           