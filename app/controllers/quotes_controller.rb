class QuotesController < ApplicationController
    protect_from_forgery
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
        @quote = Quote.all
    end

    def submissionform
        # p current_user
        @userIsLogged = !current_user.nil?
        # p @userIsLogged
    end

    def show
        @quote = Quote.find params[:id]
    end

    def create
        require 'zendesk_api'

        client = ZendeskAPI::Client.new do |config|
            config.url = ENV["ZENDESK_URL"]
            config.username = ENV["ZENDESK_USERNAME"]
            config.password = ENV["ZENDESK_PASSWORD"]
            config.retry = true
            config.raise_error_when_rate_limited = false
            require 'logger'
            config.logger = Logger.new(STDOUT)
        end   

        p = params.required(:quotes).permit(:NumAppartment, :NumFLoors, :NumBasement, :NumParking, :NumBusiness, :NumElevatorsDesired, :NumOccupantsPerFloor, :NumELevatorEstimated, :InstallFee, :SubTotal, :TotalPrice, :JobQuality)
        @quote = Quote.new(p)

        # puts 'CURRENT USER'
        # pp current_user
        @quote.user = current_user
        @quote.save!

        # ZendeskAPI::Ticket.create!(client, :type => "task", :subject => "#{current_user.username} from #{current_user.company}", :comment => { :value => "*The client* #{current_user.username} *from company* #{current_user.company} *made a submission on the* #{@quote.created_at} *with the following details :* \n\n **Elevator quality :** #{@quote.JobQuality} \n **Estimated elevators :** #{@quote.NumELevatorEstimated} \n **Subtotal :** #{@quote.SubTotal}$ \n **Install fees :** #{@quote.InstallFee}$ \n **Total price :** #{@quote.TotalPrice}$" }, :submitter_id => client.current_user.id, :priority => "urgent")
        redirect_to quotesconfirm_path
    end
end
