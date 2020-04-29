require 'factory_bot'
require 'factory_bot_rails'

FactoryBot.define do
  factory :user do
    email { "rocketelevators@test.com" }
    username { "Rocketelevators" }
    company { "Rocket Elevators" }
    password { "Qwerty1234!" }
    role_id { 1 }
  end
end