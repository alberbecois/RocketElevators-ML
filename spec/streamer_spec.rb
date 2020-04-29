require 'ElevatorMedia/streamer'
require 'rails_helper'
require 'rspotify'

RSpec.describe 'Streamer' do
  before do
    @streamer = ElevatorMedia::Streamer.new
  end

  # Checking if the streamer class is being initiliazed properly
  it 'is initializing' do
    expect(@streamer).to be_a(ElevatorMedia::Streamer)
  end

  # Checking if the streamer class is properly receiving the getContent method
  it 'is receiving the getContent method' do
    expect(@streamer).to receive(:getContent)
    @streamer.getContent
  end

  # Checking if the streamer class is responding properly to the getContent method
  it 'is responding to the getContent method' do
    expect(@streamer).to respond_to(:getContent)
  end

  # Validating that the getContent method is properly returning a string, a div tag and not nil or false
  it 'is properly returning html' do
    expect(@streamer.getContent).to be_truthy
    expect(@streamer.getContent).to include('<div>')
    expect(@streamer.getContent).to be_a(String)
  end

  describe 'Admin Panel', type: :feature do
    # Checking if I can login to the admin page properly
    it 'is properly logging in' do
      visit rails_admin_path
      result = expect(page).to have_current_path('/login')
      puts "    Did we land on the login page : #{result}"
      fill_in 'Email', with: 'mathieu.houde@codeboxx.biz'
      fill_in 'Password', with: 'Codeboxx1!'
    end
  end

  describe 'Picture' do
    # Validating that the streamer class is receiving the picture method
    it 'is receiving the picture method' do
      expect(@streamer).to receive(:picture)
      @streamer.getContent('picture')
    end
    
    # Validating that the picture method is responding, that it's accessible through the getContent method and that it's returning a string, a div tag and not nil or false
    it 'is responding to the picture method' do
      # puts @streamer.getContent('picture')
      expect(@streamer).to respond_to(:picture)
      expect(@streamer.getContent('picture')).to be_truthy
      expect(@streamer.getContent('picture')).to include('<div>')
      expect(@streamer.getContent('picture')).to be_a(String)
    end
  end

  describe 'Weather API' do
    # Validating that the streamer class is receiving the weather method
    it 'is receiving the weather method' do
      expect(@streamer).to receive(:weather)
      @streamer.getContent('weather')
    end

    # Validating that the weather api is responding, that it's accessible through the getContent method and that it's returning a string, a div tag and not nil or false
    it 'is responding to the weather method' do
      puts @streamer.getContent('weather')
      expect(@streamer).to respond_to(:weather)
      expect(@streamer.getContent('weather')).to be_truthy
      expect(@streamer.getContent('weather')).to include('<div>')
      expect(@streamer.getContent('weather')).to be_a(String)
    end
  end

  describe 'Spotify API' do
    # Validating that the streamer class is receiving the spotify method
    it 'is receiving the spotify method' do
      expect(@streamer).to receive(:spotify)
      @streamer.getContent('spotify')
    end
    
    # Validating that the spotify api is responding, that it's accessible through the getContent method and that it's returning a string, a div tag and not nil or false
    it 'is responding to the spotify method' do
      puts @streamer.getContent('spotify')
      expect(@streamer).to respond_to(:spotify)
      expect(@streamer.getContent('spotify')).to be_truthy
      expect(@streamer.getContent('spotify')).to include('<div>')
      expect(@streamer.getContent('spotify')).to be_a(String)
    end
  end

  describe 'Pokemon API' do
    # Validating that the streamer class is receiving the pokemon method
    it 'is receiving the pokemon method' do
      expect(@streamer).to receive(:pokemon)
      @streamer.getContent('pokemon')
    end    
    
    # Validating that the pokemon api is responding, that it's accessible through the getContent method and that it's returning a string, a div tag and not nil or false
    it 'is responding to the pokemon method' do
      puts @streamer.getContent('pokemon')
      expect(@streamer).to respond_to(:pokemon)
      expect(@streamer.getContent('pokemon')).to be_truthy
      expect(@streamer.getContent('pokemon')).to include('<div>')
      expect(@streamer.getContent('pokemon')).to be_a(String)
    end
  end
end