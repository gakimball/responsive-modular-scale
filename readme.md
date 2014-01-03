# Responsive Modular Scale

## Overview

This is a responsive extension of the Sass team's [modular-scale](https://github.com/Team-Sass/modular-scale) add-on. A modular typographic scale gives you a set of predefined values to use in your design, based on one or more base sizes and one or more intervals. You can learn more about modular scale typography on [A List Apart](http://www.alistapart.com/articles/more-meaningful-typography/), and quickly make a modular scale using [Tim Brown](http://twitter.com/nicewebtype)'s [modular scale tool](http://modularscale.com/).

Modular scales are great, but type has a tendency to get a little too big on smaller screens. What responsive-modular-scale allows you to do is quickly create multiple scales for different screen sizes. By changing the intervals used, but not the base sizes, we can compress the scale for smaller screens and expand it out for bigger screens. For example, a default scale could use a 1.333:1 ratio (a perfect fourth), and on screens 768px (everyone's favorite breakpoint) and up, the scale changes to use a 1.5:1 ratio (a perfect fifth) instead. Our base value stays the same, but the gaps between values in the scale widen, increasing the size of the type to a more appropriate size.

## Installation

    gem install responsive-modular-scale

Add `require 'responsive-modular-scale'` to your Compass project's config file.

Then import it into your stylesheet like so: `@import 'responsive-modular-scale';`

## Usage

### Setting scales

To create a set of scales we need one or more base values and one or more intervals. By default, the scale will use a 16px base value and two intervals: 1.333:1 (a fourth) by default, and 1.5:1 (a fifth) at 768px and above. You can change these values by calling `set-scales()` at the top of your stylesheet.

```scss
// Change just the base values, keep the default scales
@include set-scales(16px 100px);

// Use a fourth by default, and a fifth for larger screens
@include set-scales(16px, fourth(), 768px fifth());

// Use a fourth by default, an augmented fourth for medium screens, and a fifth for large screens
@include set-scales(16px, fourth(), 640px augmented-fourth(), 1024px fifth());
```

The base values should always be pixel values, but the breakpoints can be pixel- or em-based. By default, responsive-modular-scale will output all breakpoints and font-size values as em values, but you can change to pixels if you'd like.

```scss
// You can call this before or after set-scales()
@include use-pixels;

### Using the scales

Font sizes are set the same way they are in modular-scale: just pass in a number representing a position on the modular scale.

```scss
h1 {
  @include rms(6);
}
h2 {
  @include rms(5);
}
p {
  @include rms(0); // 0 is our base value
}
```

Each call to `rms()` will generate one font-size declaration for each breakpoint/scale pair you've set.

### Working with ems

If you're outputting em-based values (the default) and want to adjust your base font size from the usual 16px, you'll need to let responsive-modular-scale know.

```scss
@include set-base(18px);
```

This mixin doesn't output any CSS, it just changes the way ems are calculated internally.

If `rms()` is called on a container element, calls made on elements inside that container will not be the right size, due to the compounding nature of ems.

```scss
@include set-scales(16px, third(), 768px fourth());

.container {
  @include rms(1); // 20px, or 1.25em

  .child {
    @include rms(1); // 1.25em * 1.25em = 1.56em, or 25px
  }
}

To correct this behavior, `rms()` includes an optional second parameter which will adjust the base font size used in em calculation. The value of the second parameter is the position on the modular scale that should be used as a base.

```scss
.container {
  @include rms(1); // 1em is now 1.25em for descendant elements

  .child {
    // By passing in a different base the resulting em value will be adjusted down
    // The font sizes for .container and .child will visually be the same, despite having different em values
    @include rms(1, 1);
  }
}

Currently the mixin will only correct one level deep.

## Things to change

I'm no typography expert, so if you have any suggestions or comments, let me know! In the mean time here are things that need to be added or fixed:

- Better support for multiple ratios in a single scale: they'll only work if passed in as `1000px (fourth() fifth())`
- Allow the value of `$n` to be changed at breakpoints, to allow for finer control over font sizes
    - Expample: `@include set-scales(16px, 1.5, 768px 2); h1 { @include rms(5, 6); }`
- Ability to correct em values at more than one level deep
