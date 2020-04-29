class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|

      ##INPUTS
      t.integer :NumAppartment, null: false, default: 0
      t.integer :NumFLoors, null: false, default: 0
      t.integer :NumBasement, null: false, default: 0
      t.integer :NumParking, null: false, default: 0
      t.integer :NumBusiness, null: false, default: 0
      t.integer :NumElevatorsDesired, null: false, default: 0
      t.integer :NumOccupantsPerFloor, null: false, default: 0
      #t.integer :NumAppartment, null: false, default: 0

      ##QUALITY
      t.integer :Standard
      t.integer :Premium
      t.integer :Excellium

      ##OUTPUTS
      t.integer :NumELevatorEstimated
      t.float :InstallFee
      t.float :SubTotal
      t.float :TotalPrice


      t.timestamps null: false
    end
  end
end
