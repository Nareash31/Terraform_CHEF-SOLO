# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buff/shell_out/version'

Gem::Specification.new do |spec|
  spec.name          = "buff-shell_out"
  spec.version       = Buff::ShellOut::VERSION
  spec.authors       = ["Jamie Winsor"]
  spec.email         = ["jamie@vialstudios.com"]
  spec.description   = %q{A mixin for issuing shell commands and collecting the output}
  spec.summary       = %q{Buff up your code with a mixin for issuing shell commands and collecting the output}
  spec.homepage      = "https://github.com/berkshelf/buff-shell_out"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.2.0"

  spec.add_dependency "buff-ruby_engine", "~> 1.0"

  spec.add_development_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-spork"
  spec.add_development_dependency "spork"
end
