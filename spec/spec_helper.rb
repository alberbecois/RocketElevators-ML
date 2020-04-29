require 'simplecov'
require 'rails_helper'
require 'capybara/rspec'
SimpleCov.start

RSpec.configure do |config|
  def suppress_log_output
    allow(STDOUT).to receive(:puts)
    logger = double('Logger').as_null_object
    allow(Logger).to receive(:new).and_return(logger)
  end

  config.include Formulaic::Dsl, type: :feature
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
