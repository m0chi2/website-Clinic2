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

ActiveRecord::Schema.define(version: 2020_07_18_252525) do

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

  create_table "bothering_genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bothering_starts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "membership_number", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.date "birthday", null: false
    t.integer "sex", default: 0, null: false
    t.integer "phonenumber", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "pickadates", force: :cascade do |t|
    t.string "date", null: false
    t.string "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "bothering_start_id"
    t.integer "bothering_genre_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bothering_genre_id"], name: "index_posts_on_bothering_genre_id"
    t.index ["bothering_start_id"], name: "index_posts_on_bothering_start_id"
    t.index ["patient_id"], name: "index_posts_on_patient_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "pickadate_id"
    t.integer "membership_number"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.date "birthday", null: false
    t.integer "sex", default: 0, null: false
    t.integer "phonenumber", null: false
    t.string "email"
    t.string "exam_content"
    t.string "question_when"
    t.string "question_medical_history"
    t.string "question_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pickadate_id"], name: "index_reservations_on_pickadate_id"
  end

end
