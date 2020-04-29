class Factcontact < ActiveRecord::Migration[6.0]
  def change
    create_table :factcontact do |t|
      ##INPUTS
      t.integer :contactid, null: false, default: 0
      t.datetime :creation
      t.string :companyname, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :projectname, null: false, default: ""
    end
  end
end
