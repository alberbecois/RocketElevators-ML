class RemoveTimestampsFromAdresses < ActiveRecord::Migration[6.0]
  def change

    remove_column :adresses, :created_at, :string

    remove_column :adresses, :updated_at, :string
  end
end
