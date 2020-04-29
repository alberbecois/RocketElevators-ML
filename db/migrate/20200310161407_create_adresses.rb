class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :type_adress,        null: false, default: ""
      t.string :status,       null: false, default: ""
      t.string :entity,      null: false, default: ""
      t.string :num_street,   null: false, default: ""
      t.string :suite,            default: ""
      t.string :city,        null: false, default: ""
      t.string :postal_code,  null: false, default: ""
      t.string :country,     null: false, default: ""
      t.string :notes      

      t.timestamps
      
    end
  end
end
