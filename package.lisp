;;;; package.lisp

(uiop:define-package #:cepl.sdl2-ttf
    (:use #:cl #:alexandria #:rtg-math #:cepl)
  (:export :init :quit :with-font :text-to-tex))
