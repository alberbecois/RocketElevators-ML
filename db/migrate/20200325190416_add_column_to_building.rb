class AddColumnToBuilding < ActiveRecord::Migration[6.0]
    def change
      add_column :buildings, :longitude, :float
      add_column :buildings, :latitude, :float
    end
end