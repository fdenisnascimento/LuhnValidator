# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luhn/validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'luhn-validator'
  spec.version       = Luhn::Validator::VERSION
  spec.authors       = ['Denis Nascimento']
  spec.email         = ['fdenisnascimento@gmail.com']

  spec.summary       = 'Simple library to calculate and validate Luhn numbers'
  spec.description   = 'Simple library to calculate and validate Luhn numbers'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
