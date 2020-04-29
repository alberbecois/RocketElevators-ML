class AddUserToBuildingDetail < ActiveRecord::Migration[6.0]
  def change
    add_reference :building_details, :user, foreign_key: true
  end
end
