;;;; package.lisp

(uiop:define-package #:cepl.sdl2-ttf
    (:use #:cl #:alexandria #:rtg-math #:cepl)
  (:export :init-cepl-sdl2-ttf :quit-cepl-sdl2-ttf :with-font :text-to-tex))
