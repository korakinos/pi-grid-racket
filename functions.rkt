#lang racket/base

(provide pi-approx)
(provide pi-approx-opt1)
(provide pi-approx-opt2)

(define (pi-approx number)
  (define (dots-in-circle n)
    (let y-loop ([y 0])
      (if (= y n)
        0
        (+ (let x-loop ([x 0])
             (if (= x n)
               0
               (+ (if (< (sqrt (+ (* x x) (* y y)))
                         n)
                    1
                    0)
                  (x-loop (+ x 1)))))
           (y-loop (+ y 1))))))
  (* 4 
     (/ (dots-in-circle number) ; Punkte im Kreis
        (* number number)))) ;Punkte im Quadrat


(define (pi-approx-opt1 number)
  (define (dots-in-circle n)
    (let y-loop ([y 0])
      (if (= y n)
        0
        (+ (let x-loop ([x 0])
             (if (> (sqrt (+ (* x x) (* y y)))
                    n)
               x
               (x-loop (+ x 1))))
          (y-loop (+ y 1))))))
  (* 4 
     (/ (dots-in-circle number) ; Punkte im Kreis
        (* number number)))) ;Punkte im Quadrat
 
; Zählt nur an der Kreislinie entlang statt über die ganze Fläche, dadurch O(n) statt O(n²).
(define (pi-approx-opt2 number)
  (define (dots-in-circle n)
    (define (x-loop x y)
      (if (< (sqrt (+ (* x x) (* y y)))
             n)
        x
        (x-loop (- x 1) y)))
    (let y-loop ([y 0]
                 [start-x n]
                 [counter 0])
      (if (= y n)
        counter
        (let ([found-x 
                (+ 1 (x-loop start-x y))])
          (y-loop (+ y 1)
                  found-x
                  (+ counter
                     found-x))))))
  (* 4 
     (/ (dots-in-circle number) ; Punkte im Kreis
        (* number number)))) ;Punkte im Quadrat


