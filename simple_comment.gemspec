lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_comment/version"

Gem::Specification.new do |s|
  s.name          = "simple_comment"
  s.version       = SimpleComment::VERSION
  s.summary       = "A comment gem for ActiveRecord."
  s.description   = "A flexible attachable comment library for ActiveRecord."
  s.authors       = ["Kaid Wong"]
  s.email         = "kaid@kaid.me"
  s.homepage      = "http://github.com/kaid/simple_comment"

  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.2"

  s.add_dependency("mongoid", ">= 4.0.0")

  s.add_development_dependency("rspec", "~> 3.0.0")
  s.add_development_dependency("pry")
  s.add_development_dependency("coveralls")
end
