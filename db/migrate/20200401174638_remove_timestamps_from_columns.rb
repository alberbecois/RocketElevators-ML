class RemoveTimestampsFromColumns < ActiveRecord::Migration[6.0]
  def change

    remove_column :columns, :created_at, :string

    remove_column :columns, :updated_at, :string
  end
end
