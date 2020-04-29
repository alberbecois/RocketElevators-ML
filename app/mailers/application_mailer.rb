class ApplicationMailer < ActionMailer::Base
  #default from: 'from@example.com'
  #layout 'mailer'
  require 'sendgrid-ruby'
  include SendGrid

  def send_task_complete_email

    @lead = Lead.last
    mail = SendGrid::Mail.new
    mail.from = Email.new(email: 'info@rocketelevator.com')

    personalization = Personalization.new
    personalization.add_to(Email.new(email: @lead.email))
    personalization.add_dynamic_template_data({
    "subject" => "",
    "name" => "#{@lead.name}",
    "projectname" => "#{@lead.projectname}"
    })

    mail.add_personalization(personalization)
    mail.template_id = 'd-6709402c847a4609a8747f04e0634017'
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)


    puts response.status_code
    puts response.body
    puts response.headers
  end
end
