# Changelog

## 0.2.1 (April 8, 2014)

- Changed Gemfile to require Sass 3.2.x

## 0.2.0 (February 13, 2014)

This is a mostly-breaking version as the helper functions were renamed to avoid any possible collision with other libraries.

- Compatability with modular-scale 2.0.4
- Helper functions renamed
    - `set-scales()` is `rms-set-scales()`
    - `list-scales()` is `rms-list-scales()`
    - `use-pixels()` is `rms-use-pixels()`
    - `set-base()` is `rms-set-base()`

## 0.1.0 (January 2, 2014)

- Use em-based breakpoints and font sizes by default
    - Option to switch back to pixel-based values added (`use-pixels()`)
- Added option to change base font size from default of 16px
    - `set-base()` will change the base font size used internally by the gem's functions
    -  It doesn't output any CSS to change the body's base font size, and it also doesn't change the base value of the scale
- Added optional `$base` parameter to `rms()` mixin
    - If an element's base font size has been changed by a parent container, the value of `$n` on the modular scale used on the container can be passed as a second parameter when `rms()` is called on the child element. This will normalize the em value used
- Added debugging function which will output all scales defined: `list-scales()`
- Internal helper functions added
    - `to-em()` to convert pixel values to em
    - `strip-units()` to remove the units off of numbers

## 0.0.2 (December 29, 2013)

- Working release!
- Basic functionality in place:
    - `set-scales()` for defining scales and breakpoints
    - `rms()` for setting font sizes

## 0.0.1 (December 28, 2013)

- Broken release!
