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

ActiveRecord::Schema.define(version: 2020_07_07_023129) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "login_id", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "second_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "membership_number_id", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "birthday", null: false
    t.integer "sex", default: 0, null: false
    t.integer "phonenumber", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["membership_number_id"], name: "index_patients_on_membership_number_id"
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "membership_number_id_id"
    t.integer "exam_content_id_id"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.integer "birthday", null: false
    t.integer "sex", default: 0, null: false
    t.integer "phonenumber", null: false
    t.string "email"
    t.string "question_when"
    t.string "question_medical_histroy"
    t.string "question_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.string "time"
    t.index ["exam_content_id_id"], name: "index_reservations_on_exam_content_id_id"
    t.index ["membership_number_id_id"], name: "index_reservations_on_membership_number_id_id"
  end

end
