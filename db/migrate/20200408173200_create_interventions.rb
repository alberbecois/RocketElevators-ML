class CreateInterventions < ActiveRecord::Migration[6.0]
  def change
    create_table :interventions do |t|
      t.references :author, null: false, index: true, foreign_key: { to_table: :employees }
      t.references :customer, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true
      t.references :battery, null: true, foreign_key: true
      t.references :column, null: true, foreign_key: true
      t.references :elevator, null: true, foreign_key: true
      t.references :employee, null: true
      t.datetime :start_date, null: true
      t.datetime :end_date, null: true
      t.string "result", default: "Incomplete"
      t.text "report"
      t.string "status", default: "Pending"
      t.timestamps
    end
  end
end
