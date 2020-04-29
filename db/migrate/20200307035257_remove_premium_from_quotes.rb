class RemovePremiumFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :Premium, :integer
  end
end
