class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      # add_reference :users, :adresses 
      # add_reference :adresses

      t.datetime :creation_date
      t.string :company_name,         null: false, default: ""
      t.string :contact_fullname,     null: false, default: ""
      t.string :contact_phone,        null: false, default: ""
      t.string :company_email,        null: false, default: ""
      t.string :company_description    
      t.string :service_technical_authority_fullname,   null: false, default: ""
      t.string :service_technical_authority_phone,     null: false, default: ""    
      t.string :technical_manager_email,               null: false, default: ""

      t.timestamps
    end
  end
end
