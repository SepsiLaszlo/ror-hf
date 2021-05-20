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

ActiveRecord::Schema.define(version: 2021_05_20_185745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "course_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "courses_subject_applications", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "subject_application_id", null: false
  end

  create_table "subject_applications", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_subject_applications_on_subject_id"
    t.index ["user_id"], name: "index_subject_applications_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "credit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "neptun"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "subjects"
  add_foreign_key "subject_applications", "subjects"
  add_foreign_key "subject_applications", "users"
end
