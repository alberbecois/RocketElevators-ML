class Factquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :factquotes do |t|

      ##INPUTS
      t.integer :quoteid, null: false, default: 0
      t.datetime :creation
      t.string :companyname, null: false, default: ""
      t.string :email, null: false, default: ""
      t.integer :nbelevator, null: false, default: 0
    end
  end
end