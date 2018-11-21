
require 'capybara/rspec'
require 'site_prism'
require 'require_all'
require_all 'pages'

require_relative '/Users/avoitk/Desktop/Tutorials/TALessons/support/feature_helper.rb'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
include FeatureHelper