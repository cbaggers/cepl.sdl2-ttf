# CEPL.SDL2-TTF

A complementary library that adds a couple of simple helpers too ease making CEPL textures using the excellent sdl2-ttf.

## API

### #'init

Initialized sdl2-ttf only if not already initialized. Also checks that CEPL is initialized.

### #'quit

Shuts down sdl2-ttf only if initialized

### with-font

A helper macro that opens a font for the scope of the body

### #'text-to-tex

This function takes:

- The string to render to a texture
- A font object
- A text color as a vector4 (defaults to (v! 255 255 255 0))

It returns a CEPL texture containing the text.

## Example

```
(defun test ()
  (init)
  (with-font (font (asdf:system-relative-pathname
                    'sdl2-ttf-examples "examples/PROBE_10PX_OTF.otf"))
    (text-to-tex "hello world" font)))
```
