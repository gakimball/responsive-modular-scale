require 'compass'
require 'modular-scale'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('responsive-modular-scale', :path => extension_path)

module ResponsiveModularScale
  VERSION = "0.0.1"
  DATE = "2013-12-26"
end