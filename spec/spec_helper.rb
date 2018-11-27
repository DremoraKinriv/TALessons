

require 'capybara/rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'require_all'

$site_url = 'http://10.130.75.208'

require_all 'pages'

require_relative '..support/feature_helper.rb'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

include FeatureHelper