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

ActiveRecord::Schema.define(version: 2021_05_25_124953) do

  create_table "houses", force: :cascade do |t|
    t.integer "price"
    t.integer "prestige"
    t.integer "pirate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pirate_id"], name: "index_houses_on_pirate_id"
  end

  create_table "pirates", force: :cascade do |t|
    t.string "name"
    t.integer "gold", default: 0
    t.string "status", default: "commoner"
    t.integer "prestige", default: 0
    t.integer "user_id", null: false
    t.integer "ship_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ship_id"], name: "index_pirates_on_ship_id"
    t.index ["user_id"], name: "index_pirates_on_user_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.integer "docks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_ports_on_name", unique: true
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.integer "port_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_ships_on_name", unique: true
    t.index ["port_id"], name: "index_ships_on_port_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "houses", "pirates"
  add_foreign_key "pirates", "ships"
  add_foreign_key "pirates", "users"
  add_foreign_key "ships", "ports"
end
