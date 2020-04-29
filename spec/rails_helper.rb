require 'simplecov'
require 'spec_helper'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require_relative 'support/controller_macros'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  Capybara.configure do |config|
    config.run_server = false
    config.app_host   = 'https://www.rocketelevators.me'
  end
  config.include Formulaic::Dsl, type: :feature
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  config.extend ControllerMacros, :type => :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
