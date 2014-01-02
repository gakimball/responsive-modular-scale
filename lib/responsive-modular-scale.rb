require 'compass'
require 'modular-scale'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('responsive-modular-scale', :path => extension_path)

module ResponsiveModularScale
  VERSION = "0.1.0"
  DATE = "2014-01-02"
end