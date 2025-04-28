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

ActiveRecord::Schema[8.0].define(version: 2025_04_28_150027) do
  create_table "addresses", force: :cascade do |t|
    t.string "building_number"
    t.string "street", null: false
    t.string "postcode", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignment_submissions", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "assignment_id", null: false
    t.integer "attempt_number", default: 1, null: false
    t.date "date_submitted", null: false
    t.float "grade"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_assignment_submissions_on_assignment_id"
    t.index ["student_id"], name: "index_assignment_submissions_on_student_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "class_grade_id", null: false
    t.date "date_due", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_grade_id"], name: "index_assignments_on_class_grade_id"
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "class_cohorts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "class_teacher_id", null: false
    t.integer "grade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_teacher_id"], name: "index_class_cohorts_on_class_teacher_id"
    t.index ["grade_id"], name: "index_class_cohorts_on_grade_id"
  end

  create_table "class_grades", force: :cascade do |t|
    t.integer "grade", null: false
    t.integer "enrollment_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "forename"
    t.string "middle_name"
    t.string "surname"
    t.string "type"
    t.date "date_of_birth"
    t.integer "address_id"
    t.string "password_digest"
    t.integer "class_cohort_id"
    t.date "enrollment_date"
    t.date "employment_commencement_date"
    t.float "salary"
    t.integer "student_id"
    t.index ["address_id"], name: "index_people_on_address_id"
    t.index ["class_cohort_id"], name: "index_people_on_class_cohort_id"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
    t.index ["student_id"], name: "index_people_on_student_id"
    t.index ["username"], name: "index_people_on_username", unique: true
  end

  create_table "plagiarism_reports", force: :cascade do |t|
    t.integer "assignment_submission_id", null: false
    t.float "similarity_score"
    t.text "sources_list"
    t.date "date_generated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_submission_id"], name: "index_plagiarism_reports_on_assignment_submission_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "class_grade_id", null: false
    t.integer "class_cohort_id"
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_cohort_id"], name: "index_subjects_on_class_cohort_id"
    t.index ["class_grade_id"], name: "index_subjects_on_class_grade_id"
    t.index ["code"], name: "index_subjects_on_code", unique: true
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  add_foreign_key "assignment_submissions", "assignments"
  add_foreign_key "assignment_submissions", "people", column: "student_id"
  add_foreign_key "assignments", "class_grades"
  add_foreign_key "assignments", "subjects"
  add_foreign_key "class_cohorts", "class_grades", column: "grade_id"
  add_foreign_key "class_cohorts", "people", column: "class_teacher_id"
  add_foreign_key "people", "addresses"
  add_foreign_key "people", "class_cohorts"
  add_foreign_key "people", "people", column: "student_id"
  add_foreign_key "plagiarism_reports", "assignment_submissions"
  add_foreign_key "subjects", "class_cohorts"
  add_foreign_key "subjects", "class_grades"
  add_foreign_key "subjects", "people", column: "teacher_id"
end
