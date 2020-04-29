class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      # add_reference :customers
      # add_reference :adresses
      
      t.string :building_name,              null: false, default: ""
      t.string :building_admin_name,         null: false, default: ""
      t.string :building_admin_email    
      t.string :building_admin_phone,        null: false, default: ""
      t.string :technical_contact_fullname,  null: false, default: ""
      t.string :technical_contact_email     
      t.string :technical_contact_phone,     null: false, default: ""

      t.timestamps
    end
  end
end
