class Elevator < ApplicationRecord
    belongs_to :column
    before_update :before_slack
   
    def before_slack
       
        slack = Slack::Incoming::Webhooks.new ENV["SLACK_WEBHOOK"]
        slack.post " WARNING : Elevator #{self.id} with the Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
       
        if self.status == "Intervention"
            require 'twilio-ruby'
            numberphone = self.column.battery.building.technical_contact_phone
            client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
            from = '++12075693348' # Your Twilio number
            to = numberphone # Your mobile phone number
            client.messages.create(
            from: from,
            to: to,
            body: "Hi #{self.column.battery.building.technical_contact_fullname}, Elevator #{self.id} has now status : #{self.status}"
            )
        end
    end
end
