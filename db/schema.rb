# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160615065101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint  "user_id"
    t.bigint  "bookstore_id"
    t.text    "city"
    t.text    "country"
    t.text    "zipcode"
    t.text    "state"
    t.text    "complement"
    t.boolean "main"
    t.text    "street"
    t.text    "quarter"
  end

  create_table "book_categories", primary_key: ["book_id", "category_id"], force: :cascade do |t|
    t.bigint "book_id",     null: false
    t.bigint "category_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.text "name"
    t.text "isbn"
    t.text "author"
    t.text "language"
    t.text "publisher"
    t.text "year"
  end

  create_table "bookstore_books", primary_key: ["bookstore_id", "book_id"], force: :cascade do |t|
    t.bigint "bookstore_id", null: false
    t.bigint "book_id",      null: false
    t.bigint "stock"
  end

  create_table "bookstores", force: :cascade do |t|
    t.text "name"
    t.text "telephone"
    t.text "cnpj"
  end

  create_table "categories", force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.bigint  "user_id",     null: false
    t.text    "card_key",    null: false
    t.text    "name",        null: false
    t.text    "brand"
    t.integer "last_digits", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint   "bookstore_id", null: false
    t.text     "status"
    t.datetime "date"
  end

  create_table "package_books", primary_key: ["package_id", "book_id", "user_id"], force: :cascade do |t|
    t.bigint "package_id", null: false
    t.bigint "book_id",    null: false
    t.bigint "user_id",    null: false
  end

  create_table "packages", force: :cascade do |t|
    t.bigint   "user_id",       null: false
    t.bigint   "order_id",      null: false
    t.datetime "dispatch_date"
    t.datetime "arrival_date"
    t.bigint   "bookstore_id",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint   "user_id",           null: false
    t.bigint   "credit_card_id"
    t.text     "payment_method"
    t.datetime "created_date"
    t.datetime "updated_date"
    t.integer  "installments"
    t.text     "status"
    t.integer  "installment_value"
    t.integer  "total_value"
  end

  create_table "periodicities", force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.bigint "user_id",        null: false
    t.bigint "periodicity_id", null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.bigint   "user_id"
    t.text     "description"
    t.text     "status"
    t.datetime "created_date"
    t.text     "type"
  end

  create_table "user_books", primary_key: ["user_id", "book_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
  end

  create_table "user_preferences", primary_key: ["user_id", "category_id"], force: :cascade do |t|
    t.bigint "user_id",     null: false
    t.bigint "category_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "login"
    t.text     "encrypted_password"
    t.text     "name"
    t.text     "email"
    t.text     "telephone"
    t.text     "cpf"
    t.text     "facebook_id"
    t.text     "goodreads_id"
    t.date     "birth_date"
    t.boolean  "admin",                  default: false
    t.integer  "gender",                 default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users", name: "address_user_id_fk", on_delete: :cascade
  add_foreign_key "book_categories", "books", name: "book_preferences_fk1", on_delete: :cascade
  add_foreign_key "book_categories", "categories", name: "book_preferences_fk2", on_delete: :cascade
  add_foreign_key "bookstore_books", "books", name: "bookstore_books_fk2", on_delete: :cascade
  add_foreign_key "bookstore_books", "bookstores", name: "bookstore_books_fk1", on_delete: :cascade
  add_foreign_key "credit_cards", "users", name: "foreign_key"
  add_foreign_key "orders", "bookstores", name: "orders_id_bookstore_fkey"
  add_foreign_key "package_books", "books", name: "package_books_fk2", on_delete: :cascade
  add_foreign_key "package_books", "packages", name: "package_books_fk1", on_delete: :cascade
  add_foreign_key "packages", "orders", name: "packages_id_order_fkey"
  add_foreign_key "packages", "users", name: "packages_id_user_fkey"
  add_foreign_key "payments", "credit_cards", name: "foreign key id_credit_card payments"
  add_foreign_key "payments", "users", name: "foreign key id_user payments"
  add_foreign_key "signatures", "users", name: "foreign_key_signature"
  add_foreign_key "support_tickets", "users", name: "foreign key id_user support ticket"
  add_foreign_key "user_books", "books", name: "user_books_fk2", on_delete: :cascade
  add_foreign_key "user_books", "users", name: "user_books_fk1", on_delete: :cascade
  add_foreign_key "user_preferences", "categories", name: "user_preferences_fk2", on_delete: :cascade
  add_foreign_key "user_preferences", "users", name: "user_preferences_fk1", on_delete: :cascade
end
