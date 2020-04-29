class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :name,   null: false
      t.bigint :phone,   null: false
      t.string :email,   null: false
      t.string :businessname,   null: false
      t.string :projectname,   null: false
      t.string :department
      t.text :description
      t.text :message
      t.binary :attachment
      t.datetime :date
      t.timestamps
    end
  end
end
