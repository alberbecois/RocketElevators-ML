require 'net/http'
require 'json'

class RecognitionController < ApplicationController
    protect_from_forgery
    #  before_action :authenticate_user!
    #  before_action :authorize_admins_and_employees, only: :index

    skip_before_action :verify_authenticity_token

    def authorize_admins_and_employees
        redirect_to index_path, status: 401 unless current_user.role.id <= 2
        # puts "Current user role is #{current_user.role.id}"
    end

    def index
    end

    def upload
        # Using the read method to get the uploaded file as binary
        file = params[:uploadfile].read
    
        uri = URI('https://eastus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?cid=010c08ac-77a7-457b-8957-32d5714a6a91')
        puts "================================================="
        puts "URL : #{uri}"
        puts "================================================="

        result = Net::HTTP.new(uri.host, uri.port)

        # Creating the POST request with the content-type & key header along with the binary file upload as body
        request = Net::HTTP::Post.new(uri)
        request['Content-Type'] = 'application/json'
        request['Ocp-Apim-Subscription-Key'] = 'f8e9d0c119b54890bc4f308440792fef'
        request.body = file

        # Forcing ssl otherwise it we'll get a broken pipe error since we're using https
        result.use_ssl = true

        response = result.request(request)
        puts "================================================="
        pp response.body
        puts "================================================="

        # Rendering the transcription on recognition/upload route
        render json: response.body
    end   
end
