#lang racket
(require threading)
(provide (all-defined-out))

(define ones (λ () (cons 1 ones)))

(define nats (letrec ([f (λ (x) (cons x (λ () (f (+ x 1)))))])
               (λ () (f 1))))

(define powers-of-two (letrec ([f (λ (x) (cons x (λ () (f (* x 2)))))])
                        (λ () (f 1))))

(define (number-until s tester)
  (letrec ([f (λ (s ans)
                (let ([pr (s)])
                  (if (tester (car pr))
                      ans
                      (f (cdr pr) (+ 1 ans)))))])
    (f s 1)))

; (number-until powers-of-two (λ (x) (> x 6000)))

(define (fac x)
  (if (= x 0)
      1
      (* x (fac (- x 1)))))

(define facs (letrec ([f (λ (x) (cons (fac x) (λ () (f (+ x 1)))))])
               (λ () (f 1))))

(define (stream-to-string s n)
  (letrec ([aux (λ (s c acc)
                  (if (= c 0)
                      acc
                      (let ([pr (s)])
                        (aux
                         (cdr pr)
                         (- c 1)
                         (~>> pr
                              car
                              number->string
                              (string-append acc (if (= c n) "" " ")))))))])
    (aux s n "")))

;; (stream-to-string powers-of-two 10)
(stream-to-string facs 16)

;((cdr ((cdr ((cdr (powers-of-two)))))))

; (el . next-thunk)
