require './lib/responsive-modular-scale'

Gem::Specification.new do |s|
  s.name        = 'responsive-modular-scale'
  s.version     = ResponsiveModularScale::VERSION
  s.date        = ResponsiveModularScale::DATE
  s.description = "Responsive enhancements for the Sass modular scale."
  s.summary     = "Responsive enhancements for the Sass modular scale."
  s.authors     = ["Geoff Kimball"]
  s.email       = 'gakimball@bsu.edu'
  s.homepage    =
    'http://github.com/gakimball/responsive-modular-scale'
  s.license     = 'MIT'

  s.files = ["lib/responsive-modular-scale.rb", "readme.md", "license.md"]
  s.files += Dir.glob("stylesheets/**/*.*")

  s.add_dependency("modular-scale", [">= 1.0.6"])
end