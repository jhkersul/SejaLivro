class CreateDatabase < ActiveRecord::Migration
  def self.up
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
      t.text    "login"
      t.text    "password"
      t.text    "name"
      t.text    "email"
      t.text    "telephone"
      t.text    "cpf"
      t.text    "facebook_id"
      t.text    "goodreads_id"
      t.date    "birth_date"
      t.boolean "admin",        default: false
    end

    add_foreign_key "addresses", "users", column: "user_id", name: "address_user_id_fk", on_delete: :cascade
    add_foreign_key "book_categories", "books", column: "book_id", name: "book_preferences_fk1", on_delete: :cascade
    add_foreign_key "book_categories", "categories", column: "category_id", name: "book_preferences_fk2", on_delete: :cascade
    add_foreign_key "bookstore_books", "books", column: "book_id", name: "bookstore_books_fk2", on_delete: :cascade
    add_foreign_key "bookstore_books", "bookstores", column: "bookstore_id", name: "bookstore_books_fk1", on_delete: :cascade
    add_foreign_key "credit_cards", "users", column: "user_id", name: "foreign_key"
    add_foreign_key "orders", "bookstores", column: "bookstore_id", name: "orders_id_bookstore_fkey"
    add_foreign_key "package_books", "books", column: "book_id", name: "package_books_fk2", on_delete: :cascade
    add_foreign_key "package_books", "packages", column: "package_id", name: "package_books_fk1", on_delete: :cascade
    add_foreign_key "packages", "orders", column: "order_id", name: "packages_id_order_fkey"
    add_foreign_key "packages", "users", column: "user_id", name: "packages_id_user_fkey"
    add_foreign_key "payments", "credit_cards", column: "credit_card_id", name: "foreign key id_credit_card payments"
    add_foreign_key "payments", "users", column: "user_id", name: "foreign key id_user payments"
    add_foreign_key "signatures", "users", column: "user_id", name: "foreign_key_signature"
    add_foreign_key "support_tickets", "users", column: "user_id", name: "foreign key id_user support ticket"
    add_foreign_key "user_books", "books", column: "book_id", name: "user_books_fk2", on_delete: :cascade
    add_foreign_key "user_books", "bookstores", column: "user_id", name: "user_books_fk1", on_delete: :cascade
    add_foreign_key "user_preferences", "categories", column: "category_id", name: "user_preferences_fk2", on_delete: :cascade
    add_foreign_key "user_preferences", "users", column: "user_id", name: "user_preferences_fk1", on_delete: :cascade
  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end