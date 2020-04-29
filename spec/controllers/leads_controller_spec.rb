require 'rails_helper'
require 'spec_helper'
require 'ElevatorMedia/streamer'
require 'capybara/rspec'

RSpec.describe LeadsController, type: :controller do
  login_user

  before do
    # Supressing the puts because it was outputting the nginx server configuration because of the post method and it was ugly
    suppress_log_output
  end

  describe 'Contact Form', type: :feature do
    # Checking if we can properly fill the contact form and redirect to the message confirmation path
    it 'is filled properly and redirected to confirm path' do
      visit index_path
      result = expect(page).to have_current_path(index_path)
      puts "    Did we land on the index page : #{result}"
      post :create, params: { leads: { name: 'batman', phone: '4180000000', email: 'batman@test.com', businessname: 'Batman Inc', projectname: 'Batscam', description: 'patate', message: 'patate 2' } }
      expect(response.location).to match(message_path)
    end
  end
end