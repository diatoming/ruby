# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factorial/version'

Gem::Specification.new do |spec|
  spec.name          = "factorial"
  spec.version       = Factorial::VERSION
  spec.authors       = ["rimbaud1854"]
  spec.email         = ["rimbaud1854.91(_at_)gmail[_dot_]com"]
  spec.description   = %q{calculation of factorial numbers}
  spec.summary       = %q{return a factorial number given an integer from usr}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.3.0')
end
