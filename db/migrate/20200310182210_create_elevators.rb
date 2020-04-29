class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      # add_reference :columns

      t.string :serial_number
      t.string :model
      t.string :type_elevator
      t.string :status
      t.datetime :commissioning_date
      t.datetime :inspection_date
      t.string :certificate_inspection
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end
