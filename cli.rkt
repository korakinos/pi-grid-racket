#!/usr/bin/racket
#lang racket/base

(require "functions.rkt")
(require racket/cmdline)

(define n (make-parameter 10))
(define optimize-level (make-parameter 2))

(command-line
  #:once-each
  [("-n" "--number") number "Gitter-Seitenlänge"
                     (n (string->number number))]
  #:once-any
  [("--optimize-0") "ohne Optimierung"
                          (optimize-level 0)]
  [("--optimize-1") "leichte Optimierung"
                          (optimize-level 1)]
  [("--optimize-2") "volle Optimierung"
                          (optimize-level 2)])

(printf "n=~a~n" (n))
(cond [(= (optimize-level) 2)
       (display "Volloptimiert:\n")
       (time (exact->inexact (pi-approx-opt2 (n))))]
      [(= (optimize-level) 1)
       (display "Etwas optimiert:\n")
       (time (exact->inexact (pi-approx-opt1 (n))))]
      [(= (optimize-level) 0)
       (display "Nicht optimiert:\n")
       (time (exact->inexact (pi-approx (n))))])
