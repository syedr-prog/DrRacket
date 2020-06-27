#lang racket

;1. Precondition: takes two radii
; Postcondition: reutrns the volume between the two spheres
(define (volume radius radius2)
  (abs (-(/(* 4 3.14 radius radius radius)3) (/(* 4 3.14 radius2 radius2 radius2)3) ))
  )

;2. Precondition: takes in three arguments: two numbers and a limit.
;Postcondition: returns if number are within the limits of eachother.
(define (close number-1 number-2 limit)
  (cond
    ((and (<= (- number-1 number-2) limit) (>= (- number-1 number-2) (- limit))) #t)
    (else #f)
     )
  )

;3. Precondition: takes in a quadratic equation in three integer values (a,b,c) representing (ax^2+bx+c)
;Postcondition: returns how many solution the problem has.
(define (how-many a b c)
  (cond
    ((> (* b b) (* 4 a c)) 2)
    ((= (* b b) (* 4 a c)) 1)
    ((< (* b b) (* 4 a c)) 0)
    )
  )

;4 Precondition: takes in two strings: a statement and a word to be deleted from the statement. 
;Postcondition: returns the statement without the word
;los: list of stringsL
(define (filter-out-symbol lis symbol)
  (cond ((null? lis) '())
    ((eq? symbol (car lis))
     (filter-out-symbol (cdr lis) symbol))
    (else (cons (car lis)
                (filter-out-symbol (cdr lis) symbol)))
    )
  )

;5. Precondition: takes in a list of integers
;Postcondition: returns minimum and maximum number in the list.
(define (pMinMax L)
  (list (minList L) (maxList L))
  )
;helper funtion to calculate maximum
(define (maxList L)
  (cond ((null? (cdr L)) (car L))
         ((> (car L) (maxList (cdr L))) (car L))
          (else (maxList (cdr L))))
  )
;helper funtion to calculate minimum
(define (minList L)
  (cond ((null? (cdr L)) (car L))
        ((< (car L) (minList (cdr L))) (car L))
        (else (minList (cdr L))))
  )

;6. Precondition: higher-order function inc_n that takes an integer n as a parameter.
;Postcondition: returns an n-th increment function, which increments its parameter by n.
(define (inc_n n)
  (lambda (x) (+ n x))
  )