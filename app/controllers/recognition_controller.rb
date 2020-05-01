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

    def enrollment
        #==========================================================================#
        #=============================== ENROLLMENT ===============================#
        #==========================================================================#
        if !params[ :enrollment_file ].nil?
            enrollment = params[:enrollment_file].read
            
            uri = URI('https://RocketElevators-Recognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/81f6f5c1-66df-4820-a256-2f3d1363fb10/enroll?shortAudio=true')
            puts "================================================="
            puts "URL : #{uri}"
            puts "================================================="

            result = Net::HTTP.new(uri.host, uri.port)

            # Creating the POST request with the content-type & key header along with the binary file upload as body
            request = Net::HTTP::Post.new(uri)
            request['Content-Type'] = 'multipart/form-data'
            request['Ocp-Apim-Subscription-Key'] = 'ff37d43187954348be09545f44e4b7c7'
            request.body = enrollment
    
            # Forcing ssl otherwise it we'll get a broken pipe error since we're using https
            result.use_ssl = true
    
            response = result.request(request)
            puts "================================================="
            pp response
            puts "================================================="
    
            # Rendering the transcription on recognition/upload route
            render json: response
        end
    end

    def upload

        
                
        #==========================================================================#
        #============================= SPEECH TO TEXT =============================#
        #==========================================================================#
        if !params[ :speech_to_text_file ].nil?
            # Using the read method to get the uploaded file as binary
            file = params[:speech_to_text_file].read

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
end
