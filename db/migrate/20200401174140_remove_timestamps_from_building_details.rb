class RemoveTimestampsFromBuildingDetails < ActiveRecord::Migration[6.0]
  def change

    remove_column :building_details, :created_at, :string

    remove_column :building_details, :updated_at, :string
  end
end
