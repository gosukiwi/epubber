# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epubber/version'

Gem::Specification.new do |spec|
  spec.name          = "epubber"
  spec.version       = Epubber::VERSION
  spec.authors       = ["Federico Ramirez"]
  spec.email         = ["fedra.arg@gmail.com"]
  spec.summary       = %q{Generate EPUB files programatically}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/gosukiwi/epubber"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end