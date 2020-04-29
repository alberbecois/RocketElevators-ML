class BuildingsController < ApplicationController
    protect_from_forgery
    # geocoded_by :building_name
    # after_validation :geocode
    @@count=0

    def index
        @buildings = Building.all
        # @hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
        #     marker.lat building.adress.latitude
        #     marker.lng building.adress.longitude
        # end
    end

    def show
        @building = Building.find(params[:id])
    end

    def initialize
        @@count+=1
    end
    
    def Building.count
        @@count
    end
end