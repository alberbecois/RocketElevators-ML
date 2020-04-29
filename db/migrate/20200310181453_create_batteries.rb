class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      # add_reference :employees, 
      # add_reference :buildings

      
      t.string :type
      t.string :status
      t.datetime :commissioning_date
      t.datetime :last_inspection_date
      t.string :certificate_operations
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
