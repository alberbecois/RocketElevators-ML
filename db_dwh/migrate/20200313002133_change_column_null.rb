class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:factelevator, :commissioningdate, true)
  end
end
