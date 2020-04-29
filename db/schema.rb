# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_10_200552) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.binary "io", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_active_storage_data_on_key"
  end

  create_table "adresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_adress", default: "", null: false
    t.string "status", default: "", null: false
    t.string "entity", default: "", null: false
    t.string "num_street", default: "", null: false
    t.string "suite", default: ""
    t.string "city", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "country", default: "", null: false
    t.string "notes"
    t.float "longitude"
    t.float "latitude"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_battery"
    t.string "status"
    t.datetime "commissioning_date"
    t.datetime "last_inspection_date"
    t.string "certificate_operations"
    t.text "information"
    t.text "notes"
    t.bigint "employee_id"
    t.bigint "building_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.bigint "building_id"
    t.bigint "user_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
    t.index ["user_id"], name: "index_building_details_on_user_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_name", default: "", null: false
    t.string "building_admin_name", default: "", null: false
    t.string "building_admin_email"
    t.string "building_admin_phone", default: "", null: false
    t.string "technical_contact_fullname", default: "", null: false
    t.string "technical_contact_email"
    t.string "technical_contact_phone", default: "", null: false
    t.bigint "customer_id"
    t.bigint "adress_id"
    t.bigint "user_id"
    t.float "longitude"
    t.float "latitude"
    t.index ["adress_id"], name: "index_buildings_on_adress_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
    t.index ["user_id"], name: "index_buildings_on_user_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_column"
    t.integer "number_floors"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "creation_date"
    t.string "company_name", default: "", null: false
    t.string "contact_fullname", default: "", null: false
    t.string "contact_phone", default: "", null: false
    t.string "company_email", default: "", null: false
    t.string "company_description"
    t.string "service_technical_authority_fullname", default: "", null: false
    t.string "service_technical_authority_phone", default: "", null: false
    t.string "technical_manager_email", default: "", null: false
    t.bigint "user_id"
    t.bigint "adress_id"
    t.index ["adress_id"], name: "index_customers_on_adress_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "serial_number"
    t.string "model"
    t.string "type_elevator"
    t.string "status"
    t.datetime "commissioning_date"
    t.datetime "inspection_date"
    t.string "certificate_inspection"
    t.text "information"
    t.text "notes"
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "firstName", default: "", null: false
    t.string "title", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "interventions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "author", null: false
    t.bigint "customer_id", null: false
    t.bigint "building_id", null: false
    t.bigint "battery_id"
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.bigint "employee_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "result", default: "Incomplete"
    t.text "report"
    t.string "status", default: "Pending"
    t.index ["author"], name: "index_interventions_on_author"
    t.index ["battery_id"], name: "index_interventions_on_battery_id"
    t.index ["building_id"], name: "index_interventions_on_building_id"
    t.index ["column_id"], name: "index_interventions_on_column_id"
    t.index ["customer_id"], name: "index_interventions_on_customer_id"
    t.index ["elevator_id"], name: "index_interventions_on_elevator_id"
    t.index ["employee_id"], name: "index_interventions_on_employee_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "phone", null: false
    t.string "email", null: false
    t.string "businessname", null: false
    t.string "projectname", null: false
    t.string "department"
    t.text "description"
    t.text "message"
    t.binary "attachment"
    t.datetime "date"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "NumAppartment", default: 0, null: false
    t.integer "NumFLoors", default: 0, null: false
    t.integer "NumBasement", default: 0, null: false
    t.integer "NumParking", default: 0, null: false
    t.integer "NumBusiness", default: 0, null: false
    t.integer "NumElevatorsDesired", default: 0, null: false
    t.integer "NumOccupantsPerFloor", default: 0, null: false
    t.integer "NumELevatorEstimated", null: false
    t.float "InstallFee"
    t.float "SubTotal"
    t.float "TotalPrice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "JobQuality"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "company"
    t.bigint "role_id"
    t.index ["company"], name: "index_users_on_company", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "building_details", "users"
  add_foreign_key "buildings", "adresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "buildings", "users"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "adresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
  add_foreign_key "interventions", "batteries"
  add_foreign_key "interventions", "buildings"
  add_foreign_key "interventions", "columns"
  add_foreign_key "interventions", "customers"
  add_foreign_key "interventions", "elevators"
  add_foreign_key "interventions", "employees", column: "author"
  add_foreign_key "quotes", "users"
  add_foreign_key "users", "roles"
end
