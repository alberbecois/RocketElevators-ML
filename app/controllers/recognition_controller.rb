require 'net/http'
require 'json'
require 'find'


class RecognitionController < ApplicationController
  protect_from_forgery
#   before_action :authenticate_user!
#  before_action :authorize_admins_and_employees, only: :index

  skip_before_action :verify_authenticity_token


  def authorize_admins_and_employees
    redirect_to index_path, status: 401 unless current_user.role.id <= 2
    # puts "Current user role is #{current_user.role.id}"
  end

  def index


  end

  def upload
      puts params.inspect
      puts params[:speech]
      file_name = sanitize_filename(params[:attachment])
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
            
            p "Create profile  enrolement..."
          
          http_url = 'https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/'+idProfil.to_s+'/enroll'
          puts "create enrollement: "+http_url
          uri = URI(http_url)
          uri.query = URI.encode_www_form({
              # Request parameters
              'shortAudio' => 'true'
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

  end

  def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      puts just_filename 
      just_filename.sub(/[^\w\.\-]/,'_')
  end

  # Function that create the profil of the speaker
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

  # Function that allows to convert the audio file in binary format
  def createBinary(path="")

      p Rails.root
      absPath = File.expand_path('public/audios/'+path)
      puts "dddd "
      puts absPath
      if(File.exists?(absPath))
          puts "woooooooo "
          return File.binread(absPath)
      end
      
  end

  def audiorecognition
    # getIdentificationStatus
    #deleteAllProfil()
    puts "audio recognition "
    puts params.inspect
    filename = params[:filename]
    operationStatusUrl = params[:url]
    if operationStatusUrl == ""
      p "First find the audio before calling getOperationStatus"
      absPath = File.expand_path('public/audios/'+filename)
      puts absPath
      if(File.exists?(absPath))
          puts "woooooooo "
          # getidentificationx(File.binread(absPath))
          azurerecognitionapi(File.binread(absPath))
      end
    else
      p "call getOperationStatus directly as url already exist"
      getOperationStatus(operationStatusUrl)
    end
  end

  def azurerecognitionapi(binary)
    hash = getAllIndentificationProfil
    ids = getIdProfils(hash)
    if !ids.nil? 
        voiceidentification(ids, binary)
    else 
        p "No profile ids found ...."
    end
    
  end
  # This function helps to delete all the created profil if needed
  def deleteAllProfil()
    hash = getAllIndentificationProfil
    p "delete all profile ...."
    hash.each do |key, value|
        key.each do |k,v|
            if(k == "identificationProfileId")
              deleteProfil(v)
            end
        end
    end
    
  end
  # here we can delete one profil
  def deleteProfil(idprofil)

    p "deleting profile with id: "+idprofil.to_s
    uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/'+idprofil.to_s)
    uri.query = URI.encode_www_form({
    })

    request = Net::HTTP::Delete.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
    # Request body
    request.body = ""

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.body

  end 
  # Here we get of the profil created
  def getIdProfils(hash) 
    ids = []
    p "retrieve ids"
    hash.each do |key, value|
        key.each do |k,v|
            if(k == "identificationProfileId")
                ids.push(v)
            end
        end
    end

    p "your created profil ids"
    puts ids.take(3).join(",")
    return ids.take(3).join(",")
  end

  # Identification des profils 
  def voiceidentification(profilids, binaryfile)

    p "State identification ....."
    _http_url = 'https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds='+profilids.to_s
    #_http_url='https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds=18b05764-1057-4fe4-b03f-6704041f90ac'
    p "Voice identification endpoint: "+_http_url
        
    uri = URI(_http_url)
    # uri.query = URI.encode_www_form({
    # })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/octet-stream'
    request['Content-Length'] = 0
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
    # Request body
    request.body = binaryfile

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    header =  response.header["Operation-Location"]
    p "identify profiles operation url"
    puts header
    getOperationStatus(header)
  end

  # This function allows to get the status of the speaker recognition
  def getOperationStatus(url)
        
    uri = URI(url)
    uri.query = URI.encode_www_form({
    })

    request = Net::HTTP::Get.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
    # Request body
    request.body = ""

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    resp= JSON.parse(response.body)
    resp[:operationStatusUrl] = url.to_s
    p "operation status response ...."
    puts response.body
    respond_to do |format|
        format.json { render json: resp }
    end
  end
  
  # The get identification function 
  def getidentificationx(binaryfile)

        
    uri = URI('https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds=18b05764-1057-4fe4-b03f-6704041f90ac')
    # uri.query = URI.encode_www_form({
    #     # Request parameters
    #     #'shortAudio' => '{boolean}'
    # })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/octet-stream'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
    # Request body
    request.body = binaryfile

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.header["Operation-Location"]

  end


  def getAllIndentificationProfil

    uri = URI('https://speechelevators.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
    uri.query = URI.encode_www_form({
    })

    request = Net::HTTP::Get.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["AZURESPEAKERKEY"]
    # Request body
    request.body = ""

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.body

    return JSON.parse(response.body)
  end 

end
