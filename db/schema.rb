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

ActiveRecord::Schema.define(version: 20150721043832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chef_id"
    t.integer  "reservation_id", null: false
    t.string   "subject",        null: false
    t.text     "message",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "messages", ["chef_id"], name: "index_messages_on_chef_id", using: :btree
  add_index "messages", ["reservation_id"], name: "index_messages_on_reservation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "ingredients", null: false
    t.text     "recipe",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.text     "details"
    t.date     "date"
    t.integer  "plates"
    t.string   "time",       null: false
    t.string   "address",    null: false
    t.string   "address2"
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.string   "phone",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["chef_id"], name: "index_reservations_on_chef_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.string   "email",             null: false
    t.string   "password_digest"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "diet_restrictions"
    t.string   "allergies"
    t.string   "phone"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
