class Customer < ApplicationRecord

    belongs_to :user
    belongs_to :adress

    #after_create :upload_dropbox

    has_many :buildings
    # has_many :batteries, :through => :buildings

    # def upload_dropbox
    #     client = DropboxApi::Client.new(ENV['DROPBOX_KEY'])
    #     client.upload("/test4.txt", "Hello")

    #     # puts "*****************************Il A PASSÉ DANS LA FUNCTION *********************************"
    #     # 1. Vérifier si le customer a déjà remplie un lead
    #     leads = Lead.where(email: self.company_email)
    #     if leads and leads.size > 0
    #     # puts "******************************IL A PASSÉ DANS LA CONDITION 1 ****************************"
    #         # If  Email exists in Leads, upload the associated attached file into DropBox
    #         leads.each do |lead|
    #         #  Si non creer le folder et ajouter au dropbox
    #             if lead.attachment  != nil && self.contact_fullname != nil
    #             # puts "******************************IL A PASSÉ DANS LA CONDITION 2 ****************************"
    #                 folder = self.contact_fullname.to_s
    #                 # upload file to dropbox
    #                 client.upload("/#{folder}/#{lead.attachment.to_s}", "") 

    #              #  Supprimer le fichier de la base donnée.
    #                 lead.attachment = nil
    #                 lead.save!
    #         #  Si oui Ajouter le fichier au Dropbox
    #             elsif lead.attachment  == nil && self.contact_fullname == nil
    #                 # upload file to dropbox
    #                 client.upload("/#{folder}/#{lead.attachment.to_s}", "")

    #                 puts "**************( #{folder} )***************"

    #                 #  Supprimer le fichier de la base donnée.
    #                 lead.attachment = nil
    #                 lead.save!
    #             end
    #         end
    #     end
    # end
end