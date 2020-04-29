class AddAdressToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :adress, foreign_key: true
  end
end
