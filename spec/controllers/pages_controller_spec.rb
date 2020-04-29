require 'spec_helper'
require 'rails_helper'
require 'ElevatorMedia/streamer'
require 'capybara/rspec'

RSpec.describe PagesController, type: :controller do
  login_user
  render_views

  before do
    @streamer = ElevatorMedia::Streamer.new
  end

  # Checking if we can log in
  it 'has a current_user' do
    expect(subject.current_user).to_not eq(nil)
    puts "  The current user is #{subject.current_user.username} with the #{subject.current_user.role.name} role"
  end

  # Checking if we get a 200 status response
  it 'is giving a 200 status code' do
    expect(response.status).to eq(200)
  end

  # Checking if we can access the index page
  it 'is able to access the index page' do
    get :index
    expect(response).to have_http_status(:success)
  end

  describe 'Address' do
  # Checking if we can access the first record of the address table
  it "is properly returning the first address" do
      @adresses = Adress.all
      puts "    The street of the first address is : #{@adresses.first.num_street}"
    end
  end

  describe 'Batteries' do
  # Checking if we can access the first record of the batteries table
    it "is properly returning the first battery" do
      @batteries = Battery.all
      puts "    The status of the first battery is : #{@batteries.first.status}"
    end
  end

  describe 'Building_details' do
  # Checking if we can access the first record of the building_details table
    it "is properly returning the first building details" do
      @building_details = BuildingDetail.all
      puts "    The number of floors of the first building is : #{@building_details.first.value}"
    end
  end

  describe 'Buildings' do
  # Checking if we can access the first record of the buildings table
    it "is properly returning the first building" do
      @buildings = Building.all
      puts "    The name of the first building is : #{@buildings.first.building_name}"
    end
  end

  describe 'Columns' do
  # Checking if we can access the first record of the columns table
    it "is properly returning the first column" do
      @columns = Column.all
      puts "    The type of the first column is : #{@columns.first.type_column}"
    end
  end

  describe 'Customers' do
  # Checking if we can access the first record of the customers table
    it "is properly returning the first customer" do
      @customers = Customer.all
      puts "    The company name of the first customer is : #{@customers.first.company_name}"
    end
  end

  describe 'Elevators' do
  # Checking if we can access the first record of the elevators table
    it "is properly returning the first elevator" do
      @elevators = Elevator.all
      puts "    The status of the first elevator is : #{@elevators.first.status}"
    end
  end

  describe 'Employees' do
  # Checking if we can access the first record of the employees table
    it "is properly returning the first employee" do
      @employees = Employee.all
      puts "    The name of the first employee is : #{@employees.first.firstName} #{@employees.first.name}"
    end
  end

  describe 'Leads' do
  # Checking if we can access the first record of the leads table
    it "is properly returning the first lead" do
      @leads = Lead.all
      puts "    The name of the first lead is : #{@leads.first.name}"
    end
  end

  describe 'Quotes' do
  # Checking if we can access the first record of the quotes table
    it "is properly returning the first quote" do
      @quotes = Quote.all
      puts "    The total price of the first quote is : #{@quotes.first.TotalPrice}$"
    end
  end

  describe 'Users' do
  # Checking if we can access the first record of the users table
    it "is properly returning the first user" do
      @users = User.all
      puts "    The username of the first user is : #{@users.first.username}"
    end
  end

  describe 'Rendering the derp pokemon', type: [:view, :feature] do
  # Checking if we can display the page in which we have our derp pokemon
    it "is properly displaying the derp pokemon" do
      visit pokemon_path
      render :template => "pages/pokemon.html.erb"
      save_and_open_page
    end
  end
end




