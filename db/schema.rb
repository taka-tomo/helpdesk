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

ActiveRecord::Schema.define(version: 20150217054325) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "status_id"
  end

  add_index "inquiries", ["category_id"], name: "index_inquiries_on_category_id"
  add_index "inquiries", ["status_id"], name: "index_inquiries_on_status_id"
  add_index "inquiries", ["user_id"], name: "index_inquiries_on_user_id"

  create_table "responses", force: true do |t|
    t.text     "contents"
    t.integer  "inquiry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "responses", ["inquiry_id"], name: "index_responses_on_inquiry_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "email"
    t.string   "tel"
  end

  add_index "users", ["code"], name: "index_users_on_code", unique: true
  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
