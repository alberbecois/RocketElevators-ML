class WatsonController < ApplicationController
    protect_from_forgery
    def create
        # frozen_string_literal: true
        require "json"
        require "ibm_watson/authenticators"
        require "ibm_watson/text_to_speech_v1"
        
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: ENV["WATSON_API_KEY"]
        )
        text_to_speech = IBMWatson::TextToSpeechV1.new(
            authenticator: authenticator
        )
        text_to_speech.service_url = ENV["WATSON_URL"]

        File.open("public/watson.wav", "wb") do |audio_file|
            response = text_to_speech.synthesize(
              text: "Greetings #{current_user.username}, there are currently #{Elevator.count} elevators deployed in the #{Building.count} of your #{Customer.count} customers. Currently, #{Elevator.where(status: ['maintenance', 'inactive']).size} elevators are not in Running Status and are being serviced. You currently have #{Quote.count} quotes awaiting processing. You currently have #{Lead.count} leads in your contact requests. #{Battery.count} Batteries are deployed across #{Lead.count} cities.",
              accept: "audio/wav",
              voice: "en-US_AllisonVoice"
            )
            audio_file.write(response.result)
        end
        # puts "Greetings #{current_user.username}, there are currently #{Elevator.count} elevators deployed in the #{Building.count} of your #{Customer.count} customers. Currently, #{Elevator.where(status: ['maintenance', 'inactive']).size} elevators are not in Running Status and are being serviced. You currently have #{Quote.count} quotes awaiting processing. You currently have #{Lead.count} leads in your contact requests. #{Battery.count} Batteries are deployed across #{Lead.count} cities."
    end
end