class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :columns, :type, :type_column
    rename_column :batteries, :type, :type_battery
  end
end
