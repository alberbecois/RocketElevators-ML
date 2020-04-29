class AddCompanyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company, :string
    add_index :users, :company, unique: true
  end
end
