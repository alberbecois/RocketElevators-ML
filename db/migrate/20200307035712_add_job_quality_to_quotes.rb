class AddJobQualityToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :JobQuality, :integer
  end
end
