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

ActiveRecord::Schema.define(version: 2022_01_07_221958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.bigint "contracts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contracts_id"], name: "index_archives_on_contracts_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "code"
    t.string "contractor"
    t.string "object"
    t.string "supervisor"
    t.string "initiation_act"
    t.string "dead_line"
    t.string "value"
    t.string "executed_value"
    t.string "execution_rate"
    t.string "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "lit_value"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "type_of_device"
    t.string "number"
    t.string "operative_system"
    t.string "processor"
    t.string "memory"
    t.string "mac"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "members"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "abbreviation"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintainces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.bigint "user_id"
    t.bigint "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_maintainces_on_device_id"
    t.index ["user_id"], name: "index_maintainces_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.string "notification_origin"
    t.string "origin_id"
    t.integer "user_id", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.string "type_of_salary"
    t.integer "social_benefits"
    t.integer "basic_month"
    t.integer "basic_day"
    t.integer "basic_hour"
    t.integer "average_payment"
    t.integer "last_basic"
    t.date "last_increase_date"
    t.string "way_to_pay"
    t.string "bank"
    t.string "bank_number"
    t.string "type_of_bank_account"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_salaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "full_name", null: false
    t.string "type_of_id", null: false
    t.string "number_of_id", null: false
    t.string "telephone", null: false
    t.string "position", null: false
    t.string "date_of_birth", null: false
    t.string "working_since", null: false
    t.string "can_login", default: "si"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "disabled_since"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacations", force: :cascade do |t|
    t.date "laborated_period"
    t.date "end_of_laborated_period"
    t.date "period_until_deductions"
    t.integer "business_days"
    t.integer "holidays"
    t.date "entry_day"
    t.date "exit_day"
    t.date "last_vacations"
    t.integer "acumulated_periods"
    t.integer "suspension_days"
    t.date "date_until_suspension"
    t.string "cost_center"
    t.string "status"
    t.text "observations"
    t.string "files"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vacations_on_user_id"
  end

  add_foreign_key "archives", "contracts", column: "contracts_id"
  add_foreign_key "devices", "users"
  add_foreign_key "events", "users"
  add_foreign_key "maintainces", "devices"
  add_foreign_key "maintainces", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "salaries", "users"
  add_foreign_key "vacations", "users"
end
