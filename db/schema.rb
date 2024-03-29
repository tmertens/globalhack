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

ActiveRecord::Schema.define(version: 20161023091729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "state"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_profiles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "username"
    t.text     "bio"
    t.boolean  "require_secret"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["client_id"], name: "index_client_profiles_on_client_id", using: :btree
    t.index ["username"], name: "index_client_profiles_on_username", unique: true, using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.uuid     "uuid",          null: false
    t.string   "informal_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["uuid"], name: "index_clients_on_uuid", using: :btree
  end

  create_table "clients_organizations", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["client_id"], name: "index_clients_organizations_on_client_id", using: :btree
    t.index ["organization_id"], name: "index_clients_organizations_on_organization_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "contact_type"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "dependent_clients", force: :cascade do |t|
    t.integer  "primary_client_id"
    t.integer  "dependent_client_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "eligibility_criteria", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
  end

  create_table "helps", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.boolean  "dependents"
    t.integer  "help_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "housing_units", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "unit_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_housing_units_on_location_id", using: :btree
  end

  create_table "intake_forms", force: :cascade do |t|
    t.integer  "vispdat_score"
    t.boolean  "substance_abuse"
    t.boolean  "utility_debt"
    t.boolean  "mental_illness"
    t.integer  "client_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["client_id"], name: "index_intake_forms_on_client_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "address_id"
    t.index ["address_id"], name: "index_locations_on_address_id", using: :btree
    t.index ["organization_id"], name: "index_locations_on_organization_id", using: :btree
  end

  create_table "magic_phrases", force: :cascade do |t|
    t.uuid     "client_uuid"
    t.string   "hashed_phrase"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_uuid"], name: "index_magic_phrases_on_client_uuid", using: :btree
  end

  create_table "offering_eligibility_criteria", force: :cascade do |t|
    t.integer "service_offering_id"
    t.integer "eligibility_criteria_id"
    t.index ["eligibility_criteria_id"], name: "offering_eligibility_eligibility_index", using: :btree
    t.index ["service_offering_id"], name: "offering_eligibility_offering_index", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.uuid     "uuid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.boolean  "universal"
    t.index ["owner_id"], name: "index_organizations_on_owner_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "organization_id"
    t.integer  "possible_payment_id"
    t.string   "clearing_house",      null: false
    t.string   "transaction_id",      null: false
    t.date     "eff_date",            null: false
    t.integer  "amount_cents",        null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["clearing_house"], name: "index_payments_on_clearing_house", using: :btree
    t.index ["eff_date"], name: "index_payments_on_eff_date", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.string   "ssn"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "substance_abuser"
    t.boolean  "domestic_abuse_victim"
    t.boolean  "prior_violence"
    t.integer  "vispdat_score"
    t.index ["client_id"], name: "index_people_on_client_id", using: :btree
    t.index ["date_of_birth"], name: "index_people_on_date_of_birth", using: :btree
    t.index ["gender"], name: "index_people_on_gender", using: :btree
  end

  create_table "possible_payments", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "digested_token"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["digested_token"], name: "index_possible_payments_on_digested_token", using: :btree
  end

  create_table "service_offerings", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "service_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_service_offerings_on_location_id", using: :btree
    t.index ["service_id"], name: "index_service_offerings_on_service_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "client_profiles", "clients"
  add_foreign_key "clients_organizations", "clients"
  add_foreign_key "clients_organizations", "organizations"
  add_foreign_key "housing_units", "locations"
  add_foreign_key "intake_forms", "clients"
  add_foreign_key "locations", "organizations"
  add_foreign_key "offering_eligibility_criteria", "eligibility_criteria", column: "eligibility_criteria_id"
  add_foreign_key "offering_eligibility_criteria", "service_offerings"
  add_foreign_key "organizations", "users", column: "owner_id"
  add_foreign_key "people", "clients"
  add_foreign_key "service_offerings", "locations"
  add_foreign_key "service_offerings", "services"
end
