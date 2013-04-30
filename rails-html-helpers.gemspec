# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'rails_html_helpers/version'

Gem::Specification.new do |s|
  s.name          = "rails_html_helpers"
  s.version       = Rails::Html::Helpers::VERSION
  s.authors       = ["Florian Plank"]
  s.email         = ["florian@polarblau.com"]
  s.homepage      = "https://github.com/polarblau/rails-html-helpers"
  s.summary       = "Collection of HTML helpers"
  s.description   = "A bunch of frequently used HTML helpes for Rails apps."
  s.license       = "MIT"

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.rubyforge_project = '[none]'

  s.add_development_dependency 'rspec', '~> 2.13'
end
