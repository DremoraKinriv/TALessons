require 'cucumber'
require 'capybara/cucumber'
require 'site_prism'
require 'require_all'

$site_url = 'http://10.130.75.208'

Capybara.app_host = $site_url

require_all 'pages'

require_relative 'feature_helper'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

include FeatureHelper