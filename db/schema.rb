# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170317004012) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "delivery_address"
    t.float    "amount"
    t.float    "discount"
    t.float    "total_amount"
    t.string   "payment_method"
    t.string   "contact"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "customer_id"
    t.integer  "status"
    t.integer  "rental_period"
    t.date     "due_date"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "legal_name"
    t.string   "customer_type"
    t.string   "contact_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.string   "document"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "delivery_receipts", force: :cascade do |t|
    t.integer  "contract_id"
    t.date     "issue_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contract_id"], name: "index_delivery_receipts_on_contract_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "serial_number"
    t.decimal  "replacement_value"
    t.string   "name"
    t.text     "description"
    t.datetime "acquisition_date"
    t.string   "usage_limit"
    t.string   "image"
    t.string   "manufacturer"
    t.string   "supplier"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "category_id"
    t.boolean  "rent"
    t.index ["category_id"], name: "index_equipment_on_category_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "rental_period"
    t.decimal  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_prices_on_category_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rented_equipments", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["contract_id"], name: "index_rented_equipments_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipments_on_equipment_id"
  end

  create_table "return_receipts", force: :cascade do |t|
    t.datetime "date"
    t.integer  "contract_id"
    t.string   "document"
    t.string   "employee_contact"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contract_id"], name: "index_return_receipts_on_contract_id"
  end

end
