class RemoveStandardFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :Standard, :integer
  end
end
