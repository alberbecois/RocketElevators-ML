class Dimcustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :dimcustomers do |t|
    t.datetime "creationdate"
    t.string "companyname", default: "", null: false
    t.string "companycontactfullname", default: "", null: false
    t.string "companycontactemail", default: "", null: false
    t.integer "nbelevators", default: 0, null: false
    t.string "customercity", default: "", null: false
    end
  end
end
