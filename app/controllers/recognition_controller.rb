require 'net/http'
require 'json'

class RecognitionController < ApplicationController
    protect_from_forgery
    before_action :authenticate_user!
    before_action :authorize_admins_and_employees, only: :index

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
    
            # Rendering the respone body
            render json: response
        end
    end

    def create_profile
        if !params[ :create_profile_file ].nil?
            # profiles = params[:create_profile_file]
            
            uri = URI('https://rocketelevators-recognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
            uri.query = URI.encode_www_form({})
            puts "================================================="
            puts "URL : #{uri}"
            puts "================================================="

            # request = Net::HTTP::Post.new(uri.request_uri)
            result = Net::HTTP.new(uri.host, uri.port)
            request = Net::HTTP::Post.new(uri)

            # Creating the GET request with the content-type & key header along with the binary file upload as body
            request['Content-Type'] = 'application/json'
            request['Ocp-Apim-Subscription-Key'] = 'ff37d43187954348be09545f44e4b7c7'
            request.body = '{ "locale":"en-us", }'

            result.use_ssl = true


            # response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            #     http.request(request)
            # end

            response = result.request(request)
            puts "================================================="
            pp response.body
            puts "================================================="
    
            # Rendering the respone body
            render json: response.body
        end
    end

    def get_profiles
        if !params[ :get_profiles_file ].nil?
            profiles = params[:get_profiles_file]
            
            uri = URI('https://rocketelevators-recognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
            uri.query = URI.encode_www_form({})
            puts "================================================="
            puts "URL : #{uri}"
            puts "================================================="

            request = Net::HTTP::Get.new(uri.request_uri)

            # Creating the GET request with the content-type & key header along with the binary file upload as body
            request['Ocp-Apim-Subscription-Key'] = 'ff37d43187954348be09545f44e4b7c7'
            request.body = "{body}"

            response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                http.request(request)
            end

            puts "================================================="
            pp response.body
            puts "================================================="
    
            # Rendering the respone body
            render json: response.body
        end
    end

    def identification
        if !params[ :identification_file ].nil?
            #==========================================================================#
            #============================== POST REQUEST ==============================#
            #==========================================================================#

            # Using the read method to get the uploaded file as binary
            file = params[:identification_file].read

            uri = URI('https://RocketElevators-Recognition.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds=3ee9bdce-bfbb-4468-b4a3-b5bc8cc8de4a,e478f3eb-4049-4d02-b09a-d9a0ac94a965,f50222d5-baac-4728-9301-d94d31cea8df')
            puts "================================================="
            puts "URL : #{uri}"
            puts "================================================="
    
            result = Net::HTTP.new(uri.host, uri.port)
    
            # Creating the POST request with the content-type & key header along with the binary file upload as body
            request = Net::HTTP::Post.new(uri)
            request['Content-Type'] = 'multipart/form-data'
            request['Ocp-Apim-Subscription-Key'] = 'ff37d43187954348be09545f44e4b7c7'
            request.body = file
    
            # Forcing ssl otherwise it we'll get a broken pipe error since we're using https
            result.use_ssl = true
            response = result.request(request)
            url = response.header["operation-location"]

            #==========================================================================#
            #=============================== GET REQUEST ==============================#
            #==========================================================================#

            oplocation = url.split('operations/').last
            # pp oplocation
            
            # Adding some delay or else the identification won't have time to create itself
            sleep 45

            get_url = URI("https://rocketelevators-recognition.cognitiveservices.azure.com/spid/v1.0/operations/#{oplocation}")
            pp get_url

            get_result = Net::HTTP.new(get_url.host, get_url.port)
            get_request = Net::HTTP::Get.new(get_url)
            get_request['Ocp-Apim-Subscription-Key'] = 'ff37d43187954348be09545f44e4b7c7'

            get_result.use_ssl = true
            get_response = get_result.request(get_request)

            puts "================================================="
            pp get_response.body
            puts "================================================="

            # Rendering the respone body
            render json: get_response.body
        end
    end  

    def speech_to_text

        if !params[ :speech_to_text_file ].nil?
            # Using the read method to get the uploaded file as binary
            speech = params[:speech_to_text_file].read

            uri = URI('https://eastus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?cid=010c08ac-77a7-457b-8957-32d5714a6a91')
            puts "================================================="
            puts "URL : #{uri}"
            puts "================================================="
    
            result = Net::HTTP.new(uri.host, uri.port)
    
            # Creating the POST request with the content-type & key header along with the binary file upload as body
            request = Net::HTTP::Post.new(uri)
            request['Content-Type'] = 'application/json'
            request['Ocp-Apim-Subscription-Key'] = 'f8e9d0c119b54890bc4f308440792fef'
            request.body = speech
    
            # Forcing ssl otherwise it we'll get a broken pipe error since we're using https
            result.use_ssl = true
    
            response = result.request(request)
            puts "================================================="
            pp response.body
            puts "================================================="
    
            # Rendering the respone body
            render json: response.body
        end
    end   
end
