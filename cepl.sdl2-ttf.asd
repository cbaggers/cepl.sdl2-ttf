;;;; cepl.sdl2-ttf.asd

(asdf:defsystem #:cepl.sdl2-ttf
  :description "A few additional helpers for making working with sdl2-ttf even easier from CEPL"
  :author "Chris Bagley (Baggers) <techsnuffle@gmail.com>"
  :license "BSD 2 Clause"
  :depends-on (#:cepl.sdl2 #:sdl2-ttf #:rtg-math)
  :serial t
  :components ((:file "package")
               (:file "text-to-tex")))
