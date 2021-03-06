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

ActiveRecord::Schema.define(version: 20131125123641) do

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.decimal  "price",      precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["user_id", "product_id"], name: "index_bids_on_user_id_and_product_id"

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 9, scale: 2
    t.decimal  "step",        precision: 9, scale: 2
    t.datetime "start_at"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id", "start_at"], name: "index_products_on_user_id_and_start_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
