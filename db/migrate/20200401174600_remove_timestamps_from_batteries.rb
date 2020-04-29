class RemoveTimestampsFromBatteries < ActiveRecord::Migration[6.0]
  def change

    remove_column :batteries, :created_at, :string

    remove_column :batteries, :updated_at, :string
  end
end
