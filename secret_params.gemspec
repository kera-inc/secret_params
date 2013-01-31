# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secret_params/version'

Gem::Specification.new do |gem|
  gem.name          = "secret_params"
  gem.version       = SecretParams::VERSION
  gem.authors       = ["David Wright"]
  gem.email         = ["dave@kera.io"]
  gem.description   = %q{Secure your parameters across a system}
  gem.summary       = %q{Tools to encrypt and decrypt http parameters across an untrusted channel}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "ezcrypto"

  gem.add_development_dependency "rspec"
end
