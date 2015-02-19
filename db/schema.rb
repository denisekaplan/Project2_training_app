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

ActiveRecord::Schema.define(version: 20150219031417) do

  create_table "babies", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "parent_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "night_number"
  end

  create_table "entries", force: true do |t|
    t.time     "bedtime"
    t.time     "awake"
    t.time     "asleep"
    t.time     "wake_up"
    t.integer  "baby_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "night_number"
  end

  create_table "parents", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "photos", force: true do |t|
    t.date     "photo_date"
    t.integer  "parent_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["parent_id"], name: "index_photos_on_parent_id"

end
