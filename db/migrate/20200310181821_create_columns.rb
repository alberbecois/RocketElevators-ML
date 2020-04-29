class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      # add_reference :batteries

      t.string :type
      t.integer :number_floors
      t.string :status
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
