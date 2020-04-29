require 'rails_helper'

RSpec.describe InterventionsController, type: :controller do
  login_user

  it 'has a current_user' do
    expect(subject.current_user).to_not eq(nil)
    puts "  The current user is #{subject.current_user.username} with the #{subject.current_user.role.name} role"
  end

  # Checking if we get a 200 status response
  it 'is giving a 200 status code' do
    expect(response.status).to eq(200)
    @interventions = Intervention.all
    puts "  The status of the first intervention is : #{@interventions.first.status}"
  end

  # Checking if we can access the interventions page, but only as an admin or employee
  it 'is able to access the interventions page with admin/employee role only' do
    get :index
    expect(response).to have_http_status(:success)
  end
end