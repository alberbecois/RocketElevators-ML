class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:quotes, :NumELevatorEstimated, false)
  end
end
