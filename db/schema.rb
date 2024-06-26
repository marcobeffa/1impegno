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

ActiveRecord::Schema[7.1].define(version: 2024_06_29_144216) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "tipo"
    t.string "nome"
    t.string "descrizione"
    t.text "body"
    t.string "img_url"
    t.string "email"
    t.string "telefono"
    t.decimal "costo"
    t.decimal "ricavo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data"
    t.integer "visibility"
    t.integer "energy"
    t.integer "importanza"
    t.text "mermaid"
    t.integer "stato"
    t.decimal "costo_eur"
    t.decimal "ricavo_eur"
    t.integer "parent_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "dashes", force: :cascade do |t|
    t.decimal "eur"
    t.decimal "chf"
    t.decimal "gbp"
    t.decimal "usd"
    t.decimal "jpy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "btc"
    t.float "eth"
    t.float "ltc"
    t.float "eos"
    t.float "dot"
    t.float "link"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_url"
    t.string "username"
    t.string "nome_cognome"
    t.string "telefono"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contents", "users"
end
