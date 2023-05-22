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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_004841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name", limit: 15, null: false
    t.string "last_name", limit: 15, null: false
    t.string "middle_name", limit: 15, null: false
    t.date "dob"
    t.date "death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_authors", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "publisher_id", null: false
    t.date "published_at", null: false
    t.string "edition"
    t.string "format"
    t.string "synopsis"
    t.string "language"
    t.string "ISBN"
    t.string "genre"
    t.integer "number_of_pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "borrow_extensions", force: :cascade do |t|
    t.bigint "borrow_id", null: false
    t.bigint "extension_reason_id", null: false
    t.bigint "approver_id_id", null: false
    t.integer "extended_days", default: 10, null: false
    t.date "new_return_date", null: false
    t.decimal "cost", precision: 10, scale: 2, default: "0.0", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approver_id_id"], name: "index_borrow_extensions_on_approver_id_id"
    t.index ["borrow_id"], name: "index_borrow_extensions_on_borrow_id"
    t.index ["extension_reason_id"], name: "index_borrow_extensions_on_extension_reason_id"
  end

  create_table "borrows", force: :cascade do |t|
    t.bigint "physical_book_id", null: false
    t.bigint "user_id", null: false
    t.bigint "approver_id", null: false
    t.bigint "return_inspector_id", null: false
    t.datetime "borrow_date", null: false
    t.datetime "scheduled_return_date", null: false
    t.datetime "returned_at"
    t.decimal "cost", precision: 10, scale: 2, default: "0.0", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approver_id"], name: "index_borrows_on_approver_id"
    t.index ["physical_book_id"], name: "index_borrows_on_physical_book_id"
    t.index ["return_inspector_id"], name: "index_borrows_on_return_inspector_id"
    t.index ["user_id"], name: "index_borrows_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "photo"
    t.bigint "issuer_id", null: false
    t.boolean "active"
    t.boolean "true"
    t.boolean "lost"
    t.boolean "false"
    t.datetime "issue_date", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issuer_id"], name: "index_cards_on_issuer_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "department_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_departments_on_department_id"
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "extension_reasons", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_extension_reasons_on_name"
  end

  create_table "facultie_groups", force: :cascade do |t|
    t.bigint "facultie_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facultie_id"], name: "index_facultie_groups_on_facultie_id"
    t.index ["group_id"], name: "index_facultie_groups_on_group_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "physical_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.datetime "bought", null: false
    t.datetime "decommissioned"
    t.decimal "monetary_value", precision: 10, scale: 2, default: "0.0", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_physical_books_on_book_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.string "link"
    t.string "country"
    t.string "address"
    t.string "email"
    t.string "website"
    t.integer "founded_year"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "student_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "year"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_student_infos_on_group_id"
    t.index ["user_id"], name: "index_student_infos_on_user_id"
  end

  create_table "teacher_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "admission_date"
    t.bigint "facultie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facultie_id"], name: "index_teacher_infos_on_facultie_id"
    t.index ["user_id"], name: "index_teacher_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", limit: 30
    t.string "pfp"
    t.string "email", null: false
    t.string "phone_number", limit: 10
    t.string "first_name", limit: 15, null: false
    t.string "last_name", limit: 15, null: false
    t.string "middle_name", limit: 15, null: false
    t.bigint "role_id", null: false
    t.bigint "department_id", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "type"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
  add_foreign_key "borrow_extensions", "borrows"
  add_foreign_key "borrow_extensions", "extension_reasons"
  add_foreign_key "borrow_extensions", "users", column: "approver_id_id"
  add_foreign_key "borrows", "physical_books"
  add_foreign_key "borrows", "users"
  add_foreign_key "borrows", "users", column: "approver_id"
  add_foreign_key "borrows", "users", column: "return_inspector_id"
  add_foreign_key "cards", "users"
  add_foreign_key "cards", "users", column: "issuer_id"
  add_foreign_key "departments", "departments"
  add_foreign_key "facultie_groups", "faculties", column: "facultie_id"
  add_foreign_key "facultie_groups", "groups"
  add_foreign_key "physical_books", "books"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "student_infos", "groups"
  add_foreign_key "student_infos", "users"
  add_foreign_key "teacher_infos", "faculties", column: "facultie_id"
  add_foreign_key "teacher_infos", "users"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
