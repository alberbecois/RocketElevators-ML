class RemoveExcelliumFromQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :Excellium, :integer
  end
end
