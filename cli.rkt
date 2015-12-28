#!/usr/bin/racket
#lang racket/base

(require "functions.rkt")

(display "Testläufe mit n=3000:\n")
(display "volloptimiert:\n")
(time (exact->inexact (pi-approx-opt2 3000)))
(display "etwas optimiert:\n")
(time (exact->inexact (pi-approx-opt1 3000)))
(display "nicht optimiert:\n")
(time (exact->inexact (pi-approx      3000))) 
