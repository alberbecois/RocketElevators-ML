require 'rails_helper'
require 'httparty'
require 'open_weather'
require 'rspotify'
require 'poke-api-v2'
require 'json'

module ElevatorMedia
  class Streamer
    # The getContent method which returns a specified content, default being weather
    def getContent(content = 'weather')
      return picture if content == 'picture'
      return weather if content == 'weather'
      return spotify if content == 'spotify'
      return pokemon if content == 'pokemon'
    end

    # The picture method which returns a picture within div tags
    def picture
      response = HTTParty.get('https://picsum.photos/id/237/200/300')
      result = response.parsed_response
      return "<div>#{result}</div>"
    end

    # The weather method which returns the current weather in Quebec city within div tags
    def weather
      options = { units: 'metric', APPID: ENV['OPEN_WEATHER'] }
      result = OpenWeather::Current.city_id('6115047', options)
      return "    <div>Current weather: #{result['weather'][0]['main']} with #{result['main']['temp']}°C and #{result['main']['humidity']}% humidity.</div>"
    end

    # The spotify method which returns the current jazz playlist within div tags
    def spotify
      RSpotify.authenticate(ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'])
      # RSpotify.raw_response = true
      result = RSpotify::Playlist.search('Jazz')
      return "    <div>You are listening to the #{result.first.name} playlist, it is described as '#{result.first.description}' with #{result.first.total} songs!</div>"
    end

    # The pokemon method which returns a derp pokemon within div tags
    def pokemon
      result = PokeApi.get(pokemon: 'bulbasaur')
      return "    <div>The pokemon's name is #{result.name}, his height is #{result.height} decimeter, it weights #{result.height} hectograms and belongs to the #{result.species.name} specy.</div>"
    end
  end
end