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

ActiveRecord::Schema.define(version: 2019_05_22_030308) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "crites", force: :cascade do |t|
    t.integer "rubric_id"
    t.integer "index"
    t.string "criteria_description"
    t.string "outcome"
    t.text "meet_the_specification"
    t.boolean "mandatory"
    t.string "criteria_type"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rubric_id"], name: "index_crites_on_rubric_id"
  end

  create_table "grade_crites", force: :cascade do |t|
    t.integer "grade_record_id"
    t.integer "index"
    t.string "criteria_description"
    t.string "outcome"
    t.text "meet_the_specification"
    t.string "status"
    t.decimal "point"
    t.text "comment"
    t.boolean "mandatory"
    t.string "criteria_type"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_record_id"], name: "index_grade_crites_on_grade_record_id"
  end

  create_table "grade_records", force: :cascade do |t|
    t.integer "rubric_id"
    t.text "comment"
    t.decimal "point"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mentor_email"
    t.string "learner_email"
    t.string "grade_type"
    t.index ["rubric_id"], name: "index_grade_records_on_rubric_id"
  end

  create_table "learners", force: :cascade do |t|
    t.string "full_name"
    t.string "code"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_mentors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mentors_on_reset_password_token", unique: true
  end

  create_table "rubrics", force: :cascade do |t|
    t.string "assignment"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rubric_code"
  end

end
