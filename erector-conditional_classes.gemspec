# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erector/conditional_classes/version'

Gem::Specification.new do |spec|
  spec.name          = "erector-conditional_classes"
  spec.version       = Erector::ConditionalClasses::VERSION
  spec.authors       = ["Scott Fleckenstein"]
  spec.email         = ["nullstyle@gmail.com"]
  spec.description   = %q{Erector extension for conditional classes}
  spec.summary       = %q{Adds helpers to make conditional classes on an element more friendly}
  spec.homepage      = "https://github.com/nullstyle/erector-conditional_classes"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "erector", ">= 0.9.0"
  spec.add_dependency "activesupport", ">= 3.0.0"
end
