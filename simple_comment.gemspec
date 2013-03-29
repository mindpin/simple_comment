version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = 'simple_comment'
  s.version     = version
  s.summary     = 'A comment gem for ActiveRecord.'
  s.description = 'A flexible attachable comment library for ActiveRecord.'
  s.authors     = ['Kaid Wong']
  s.email       = 'kaid@kaid.me'
  s.files       = Dir.glob('lib/**/*[^(~|#)]') + %w(simple_comment.gemspec VERSION)
  s.homepage    = 'http://github.com/kaid/simple_comment'

  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency('activerecord', '3.2.12')

  s.add_development_dependency('sqlite3', '~> 1.3.7')
  s.add_development_dependency('factory_girl', '~> 4.2.0')
  s.add_development_dependency('database_cleaner', '~> 0.9.1')
  s.add_development_dependency('rspec', '~> 2.13.0')
end
