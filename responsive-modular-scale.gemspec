Gem::Specification.new do |s|
  s.name        = 'responsive-modular-scale'
  s.version     = ResponsiveModularScale::VERSION
  s.date        = ResponsiveModularScale::DATE
  s.description = "Responsive enhancements for the Sass modular scale."
  s.summary     = "Responsive enhancements for the Sass modular scale."
  s.authors     = ["Geoff Kimball"]
  s.email       = 'gakimball@bsu.edu'
  s.files       = ["lib/hola.rb"]
  s.homepage    =
    'http://github.com/gakimball/responsive-modular-scale'
  s.license       = 'MIT'
  s.add_dependency("modular-scale",   [">= 1.0.6"])
end