# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_03_044610) do
  create_table "coaches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaches_coaching_programs", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "coaching_program_id", null: false
    t.bigint "coach_id", null: false
    t.index ["coach_id", "coaching_program_id"], name: "idx_on_coach_id_coaching_program_id_1b71bbaa34"
    t.index ["coaching_program_id", "coach_id"], name: "idx_on_coaching_program_id_coach_id_e4b85896e3"
  end

  create_table "coaches_companies", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "coach_id", null: false
    t.index ["coach_id", "company_id"], name: "index_coaches_companies_on_coach_id_and_company_id"
    t.index ["company_id", "coach_id"], name: "index_coaches_companies_on_company_id_and_coach_id"
  end

  create_table "coaching_programs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_coaching_programs_on_company_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "zip"
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "country"
    t.string "website"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "department"
    t.string "email"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coaching_program_id", null: false
    t.bigint "coach_id"
    t.index ["coach_id"], name: "index_employees_on_coach_id"
    t.index ["coaching_program_id"], name: "index_employees_on_coaching_program_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coaching_programs", "companies"
  add_foreign_key "employees", "coaches"
  add_foreign_key "employees", "coaching_programs"
  add_foreign_key "employees", "companies"
end
