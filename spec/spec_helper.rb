require 'rails/engine'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'lib', 'rails_html_helpers')

RSpec.configure do |config|
  config.order = 'random'
end
