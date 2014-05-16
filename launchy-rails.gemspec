# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'launchy/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "launchy-rails"
  spec.version       = Launchy::Rails::VERSION
  spec.authors       = ["David Rubin"]
  spec.email         = ["david@fireid.com"]
  spec.summary       = %q{Opens the browser on server start up}
  spec.description   = %q{Opens the browser on server start up}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "launchy", "> 2.0.0"
end
