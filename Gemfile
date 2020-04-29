source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

############### RAILS CORE GEMS ###############
ruby '2.6.5'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'active_record_doctor', group: :development
gem 'bootsnap', '>= 1.1.0', require: false

############### IMPORTANT GEMS ###############
gem 'jquery-rails'
gem 'bootstrap', '~> 4.4.1'
gem 'popper_js'
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'rails_admin', '~> 2.0'
gem 'cancancan'
gem 'rolify'
gem 'figaro'
gem 'httparty'
gem 'pg'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'secure_headers'
gem 'recaptcha'
gem "factory_bot_rails"
gem 'capybara'
gem 'formulaic'

############### APIS ###############
gem 'sendgrid-ruby'
gem "zendesk_api", git: 'https://github.com/zendesk/zendesk_api_client_rb'
gem 'slack-ruby-client'
gem 'async-websocket', '~> 0.8.0'
gem 'slack-notifier'
gem 'slack-incoming-webhooks'
gem 'twilio-ruby'
gem 'gmaps4rails'
gem 'geocoder'
gem 'ibm_watson'
gem 'dropbox_api'
gem 'open-weather'
gem 'rspotify'
gem 'poke-api-v2'

############### DEPLOYMENT ###############
gem 'capistrano', '~> 3.10', require: false
gem 'capistrano-rails', '~> 1.4', require: false
gem 'capistrano-bundler', '>= 1.1.0'
gem 'rvm1-capistrano3', require: false
gem 'capistrano3-puma'
gem 'ed25519'
gem 'bcrypt_pbkdf'

############### OTHER ###############
gem 'draper'
gem 'pundit'
gem 'groupdate'
gem 'blazer'
gem 'activestorage-database-service', github: 'TitovDigital/activestorage-database-service'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-generators'
gem 'json'
gem 'simplecov', require: false, group: :test
gem 'webmock'
gem 'launchy'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end