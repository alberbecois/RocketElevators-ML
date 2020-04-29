class AddColumnToAdress < ActiveRecord::Migration[6.0]
    def change
      add_column :adresses, :longitude, :float
      add_column :adresses, :latitude, :float
    end
end