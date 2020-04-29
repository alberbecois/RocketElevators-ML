class AddAdressToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :adress, foreign_key: true
  end
end
