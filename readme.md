# Responsive Modular Scale

## Overview

This is a responsive extension of the Sass team's [modular-scale](https://github.com/Team-Sass/modular-scale) add-on. A modular typographic scale gives you a set of predefined values to use in your design, based on one or more base sizes and one or more intervals. You can learn more about modular scale typography on [A List Apart](http://www.alistapart.com/articles/more-meaningful-typography/), and quickly make a modular scale using [Tim Brown](http://twitter.com/nicewebtype)'s [modular scale tool](http://modularscale.com/).

Modular scales are great, but type has a tendency to get a little too big on smaller screens. What responsive-modular-scale allows you to do is quickly create multiple scales for different screen sizes. By changing the intervals used, but not the base sizes, we can compress the scale for smaller screens and expand it out for bigger screens. For example, a default scale could use a 1.333:1 ratio (a perfect fourth), and on screens 768px (everyone's favorite breakpoint) and up, the scale changes to use a 1.5:1 ratio (a perfect fifth) instead. Our base value stays the same, but the gaps between values in the scale widen, increasing the size of the type to a more appropriate size.

## Installation

    gem install responsive-modular-scale

Add `require 'responsive-modular-scale'` to your Compass project's config file.

Then import it into your stylesheet like so: `@import 'responsive-modular-scale';`

## Usage

To create a scale we need one or more base values and one or more intervals. By default, the scale will use a 16px base value and two intervals: 1.333:1 (a fourth) by default, and 1.5:1 (a fifth) at 768px and above. You can change these values by calling `set-scales()` at the top of your stylesheet.

```scss
// Change just the base values, not the intervals
@include set-scales(16px 100px);

// Use a fourth by default, and a fifth for larger screens
@include set-scales(16px, fourth(), 768px fifth());

// Use a fourth by default, an augmented fourth for medium screens, and a fifth for large screens
@include set-scales(16px, fourth(), 640px augmented-fourth(), 1024px fifth());
```

Now we just have to call the modular scale function.

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

## Things to change

I'm no typography expert, so if you have any suggestions or comments, let me know! In the mean time here are things that need to be added or fixed:

- Better support for multiple ratios: they'll only work if passed in as `1000px (fourth() fifth())`
- Switch to em-based font sizes and breakpoints
-- Add the ability to correct an em value if the base font size has changed
- Allow the value of `$n` to be changed at breakpoints, to allow for finer control over font sizes
-- Expample: `@include set-scales(16px, 1.5, 768px 2); h1 { @include rms(5, 6); }