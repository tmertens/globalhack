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

ActiveRecord::Schema.define(version: 20161022020514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.float    "latitude"
    t.string   "state"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_service_providers", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "service_provider_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["client_id"], name: "index_client_service_providers_on_client_id", using: :btree
    t.index ["service_provider_id"], name: "index_client_service_providers_on_service_provider_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.date     "date_of_birth"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "housing_locations", force: :cascade do |t|
    t.integer  "service_provider_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["service_provider_id"], name: "index_housing_locations_on_service_provider_id", using: :btree
  end

  create_table "housing_units", force: :cascade do |t|
    t.integer  "housing_location_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["housing_location_id"], name: "index_housing_units_on_housing_location_id", using: :btree
  end

  create_table "service_providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "client_service_providers", "clients"
  add_foreign_key "client_service_providers", "service_providers"
  add_foreign_key "housing_locations", "service_providers"
  add_foreign_key "housing_units", "housing_locations"
end
