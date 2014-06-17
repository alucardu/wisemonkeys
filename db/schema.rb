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

ActiveRecord::Schema.define(version: 20140611094929) do

  create_table "businessrequests", force: true do |t|
    t.string   "kvk"
    t.string   "company"
    t.string   "phone"
    t.text     "request"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "competitions", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "prize"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "deadline_signin"
    t.string   "prize_2"
    t.string   "prize_3"
  end

  create_table "pictures", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "image_cache"
    t.integer  "competition_id"
    t.integer  "user_id"
  end

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "administrator",        default: false
    t.string   "authentication_token"
    t.boolean  "b_account",            default: false
    t.boolean  "activated",            default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "votes", force: true do |t|
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
