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

ActiveRecord::Schema.define(version: 20140210115838) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: true do |t|
    t.text     "text"
    t.string   "privacy",          default: "private"
    t.integer  "sender_user_id"
    t.integer  "receiver_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["created_at"], name: "index_updates_on_created_at"
  add_index "updates", ["receiver_user_id"], name: "index_updates_on_receiver_user_id"
  add_index "updates", ["sender_user_id"], name: "index_updates_on_sender_user_id"

  create_table "user_connections", force: true do |t|
    t.integer  "sender_user_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sub_categories", force: true do |t|
    t.integer  "user_id"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name"
    t.string   "gender"
    t.string   "summary"
    t.integer  "height"
    t.integer  "bust"
    t.integer  "hips"
    t.integer  "shoes"
    t.string   "hair"
    t.string   "eyes"
    t.date     "birthdate"
    t.string   "available"
    t.string   "plan"
    t.datetime "plan_end"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
