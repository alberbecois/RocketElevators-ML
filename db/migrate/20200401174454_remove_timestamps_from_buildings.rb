class RemoveTimestampsFromBuildings < ActiveRecord::Migration[6.0]
  def change

    remove_column :buildings, :created_at, :string

    remove_column :buildings, :updated_at, :string
  end
end
