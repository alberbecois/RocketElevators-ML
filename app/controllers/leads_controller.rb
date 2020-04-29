class LeadsController < ApplicationController
    protect_from_forgery
    def index
        @lead = Lead.all
    end

    def create
        # require 'zendesk_api'
        # puts params
        # client = ZendeskAPI::Client.new do |config|
        #     config.url = ENV["ZENDESK_URL"]
        #     config.username = ENV["ZENDESK_USERNAME"]
        #     config.password = ENV["ZENDESK_PASSWORD"]
        #     config.retry = true
        #     config.raise_error_when_rate_limited = false
        #     require 'logger'
        #     config.logger = Logger.new(STDOUT)
        # end  
        p = params.required(:leads).permit(:name, :phone, :email, :businessname, :projectname, :message)
        # p = params.required(:leads).permit(:fullname, :phone, :email, :businessname, :projectname, :department, :description, :message, :attachment)
        @lead = Lead.new(p)
        @lead.save!

        # ZendeskAPI::Ticket.create!(client, :type => "question", :subject => "#{@lead.name} from #{@lead.businessname}", :comment => { :value => "*The contact* #{@lead.name} *from company* #{@lead.businessname} *can be reached at email* #{@lead.email} *and at phone number* #{@lead.phone}. #{@lead.department} *has a project named* #{@lead.projectname} *which would require contribution from Rocket Elevators.*\n\n #{@lead.description} \n\n Attached Message: #{@lead.message} \n\n #{@lead.attachment == nil ? "" : "*The Contact uploaded an attachment*"}" }, :submitter_id => client.current_user.id, :priority => "urgent")
        ApplicationMailer.send_task_complete_email.deliver_now
        redirect_to message_path
    end
end