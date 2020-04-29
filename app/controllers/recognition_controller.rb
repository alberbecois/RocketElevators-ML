require 'net/http'
require 'json'
require 'find'


class RecognitionController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!
  before_action :authorize_admins_and_employees, only: :index

  def authorize_admins_and_employees
    redirect_to index_path, status: 401 unless current_user.role.id <= 2
    # puts "Current user role is #{current_user.role.id}"
  end

  def index


  end

  def upload
      puts params.inspect
      puts params[:speech]
      file_name = sanitize_filename(params[:attachement1])
      puts "File name : "+file_name
      puts "Key: "+ENV["AZURESPEAKERKEY"]
      binaryOfFile = createBinary(file_name)
      if(!binaryOfFile.nil?)
          p "Create the indentification profile ..."
          
            identificationProfileIds = createProfile()
            puts identificationProfileIds
            hash = JSON.parse(identificationProfileIds)
            puts hash["identificationProfileId"]
            
            idProfil =  hash["identificationProfileId"]
            # idProfil = '92489933-e1e7-4fea-97d2-2084d427ad9d'
            p "Create profile  enrolement..."
          
          http_url = 'https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/'+idProfil.to_s+'/enroll'
          puts "create enrollement: "+http_url
          uri = URI(http_url)
          uri.query = URI.encode_www_form({
              # Request parameters
              'shortAudio' => 'false'
          })

          request = Net::HTTP::Post.new(uri.request_uri)
          # Request headers
          request['Content-Type'] = 'application/octet-stream'
          # Request headers
          request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
          # Request body
          request.body = binaryOfFile

          response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
              http.request(request)
          end
          
          puts response.body

      end

      #puts params[:attachement1]
      #puts params[:attachement1].read


      

  end

  def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      puts just_filename 
      just_filename.sub(/[^\w\.\-]/,'_')
  end

  def createProfile
        p "Create a profil ..."
        p "Key:"+ENV["AZURESPEAKERKEY"]
      uri = URI('https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
      uri.query = URI.encode_www_form({
      })

      request = Net::HTTP::Post.new(uri.request_uri)
      # Request headers
      request['Content-Type'] = 'application/json'
      # Request headers
      request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
      # Request body
      request.body = "{ \"locale\":\"en-us\"}"

      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
          http.request(request)
      end

      response.body
  end

  def createBinary(path="")

      p Rails.root
      absPath = File.expand_path('app/assets/audios/'+path)
      puts "dddd "
      puts absPath
      if(File.exists?(absPath))
          puts "woooooooo "
          return File.binread(absPath)
      end
      
  end





end
