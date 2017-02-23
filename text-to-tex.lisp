(in-package #:cepl.sdl2-ttf)

(defun init ()
  (unless (= 1 (sdl2-ttf:was-init))
    (assert (and (find-package :cepl.sdl2)
                 cepl.context:*gl-context*)
            () "CEPL must be initialized before text-to-tex")
    (unless (= 0 (sdl2-ttf:init))
      (error "Failed to initialize text-to-tex"))
    t))

(defun quit ()
  (when (= 1 (sdl2-ttf:was-init))
    (sdl2-ttf:quit)))

(defmacro with-font ((var-name path &optional (point-size 10)) &body body)
  `(let ((,var-name (sdl2-ttf:open-font ,path ,point-size)))
     (unwind-protect (progn ,@body)
       (sdl2-ttf:close-font ,var-name))))

(defun text-to-tex (text font &optional (color (v! 255 255 255 0)))
  (let* ((texture-surface (sdl2-ttf:render-text-blended
                           font text
                           (round (x color)) (round (y color))
                           (round (z color)) (round (w color))))
         (width (sdl2:surface-width texture-surface))
         (height (sdl2:surface-height texture-surface)))
    (prog1 (let ((carr (make-c-array-from-pointer
                         (list width height)
                         :uint8-vec4
                         (sdl2:surface-pixels texture-surface))))
             (make-texture carr))
      (sdl2:free-surface texture-surface))))

(defun test ()
  (with-font (font (asdf:system-relative-pathname
                    'sdl2-ttf-examples "examples/PROBE_10PX_OTF.otf"))
    (text-to-tex "hello world" font)))
