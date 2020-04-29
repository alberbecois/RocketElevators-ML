class AddUserToBuilding < ActiveRecord::Migration[6.0]
  def change
    add_reference :buildings, :user, foreign_key: true
  end
end
