class RemoveTimestampsFromElevators < ActiveRecord::Migration[6.0]
  def change

    remove_column :elevators, :created_at, :string

    remove_column :elevators, :updated_at, :string
  end
end
