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

ActiveRecord::Schema[7.0].define(version: 2023_02_12_200209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "photo", null: false
    t.string "first_name", limit: 15, null: false
    t.string "last_name", limit: 15, null: false
    t.string "middle_name", limit: 15, null: false
    t.date "dob"
    t.date "death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_links", force: :cascade do |t|
    t.bigint "book_publisher_id", null: false
    t.string "link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_publisher_id"], name: "index_book_links_on_book_publisher_id"
  end

  create_table "book_publishers", force: :cascade do |t|
    t.string "cover_pic"
    t.bigint "book_title_id", null: false
    t.bigint "publisher_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_title_id"], name: "index_book_publishers_on_book_title_id"
    t.index ["publisher_id"], name: "index_book_publishers_on_publisher_id"
  end

  create_table "book_titles", force: :cascade do |t|
    t.string "name", null: false
    t.date "published_at", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_titles_on_author_id"
  end

  create_table "books", force: :cascade do |t|
    t.bigint "book_publisher_id", null: false
    t.datetime "bought", null: false
    t.datetime "decommissioned"
    t.decimal "monetary_value", precision: 10, scale: 2, default: "0.0", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_publisher_id"], name: "index_books_on_book_publisher_id"
  end

  create_table "borrow_extensions", force: :cascade do |t|
    t.bigint "borrow_id", null: false
    t.bigint "extension_reason_id", null: false
    t.bigint "approver_id_id", null: false
    t.integer "extended_days", default: 10, null: false
    t.date "new_return_date", null: false
    t.decimal "cost", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approver_id_id"], name: "index_borrow_extensions_on_approver_id_id"
    t.index ["borrow_id"], name: "index_borrow_extensions_on_borrow_id"
    t.index ["extension_reason_id"], name: "index_borrow_extensions_on_extension_reason_id"
  end

  create_table "borrows", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.bigint "approver_id_id", null: false
    t.bigint "return_inspector_id_id", null: false
    t.datetime "borrow_date", null: false
    t.datetime "return_date", null: false
    t.datetime "returned_at"
    t.decimal "cost", precision: 10, scale: 2, default: "0.0", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approver_id_id"], name: "index_borrows_on_approver_id_id"
    t.index ["book_id"], name: "index_borrows_on_book_id"
    t.index ["return_inspector_id_id"], name: "index_borrows_on_return_inspector_id_id"
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
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "publishers", force: :cascade do |t|
    t.string "photo"
    t.string "name", null: false
    t.string "link", null: false
    t.string "country"
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
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "book_links", "book_publishers"
  add_foreign_key "book_publishers", "book_titles"
  add_foreign_key "book_publishers", "publishers"
  add_foreign_key "book_titles", "authors"
  add_foreign_key "books", "book_publishers"
  add_foreign_key "borrow_extensions", "borrows"
  add_foreign_key "borrow_extensions", "extension_reasons"
  add_foreign_key "borrow_extensions", "users", column: "approver_id_id"
  add_foreign_key "borrows", "books"
  add_foreign_key "borrows", "users"
  add_foreign_key "borrows", "users", column: "approver_id_id"
  add_foreign_key "borrows", "users", column: "return_inspector_id_id"
  add_foreign_key "cards", "users"
  add_foreign_key "cards", "users", column: "issuer_id"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
