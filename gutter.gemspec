$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gutter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'gutter'
  s.version = Gutter::VERSION
  s.authors = ['Rajeev Kannav Sharma']
  s.email = ['rajeevsharma86@gmail.com']
  s.homepage = 'http://rajeevkannav.github.io/gutter'
  s.summary = 'Gutter - Linux-Ruby DashBoard'
  s.description = 'A low-overhead monitoring web dashboard for a GNU/Linux machine. Simply drop-in the app and go!'
  s.files = `git ls-files`.split("\n").reject { |f| f =~ /^test|^dummy/ }
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.test_files = Dir["test/**/*"]
  s.add_dependency 'railties'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'jquery-datatables-rails'
end
