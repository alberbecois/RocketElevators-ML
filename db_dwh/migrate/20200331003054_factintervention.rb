class Factintervention < ActiveRecord::Migration[6.0]
  def change
    create_table :factintervention do |t|
      t.references :employee
      t.references :building
      t.references :battery, null: true
      t.references :column, null: true
      t.references :elevator, null: true
      t.datetime :start_date
      t.datetime :end_date, null: true
      t.string "result", default: "", null: true
      t.string "report", default: ""
      t.string "status", default: ""
    end
  end
end