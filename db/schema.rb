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

ActiveRecord::Schema.define(version: 20160824195516) do

  create_table "applications", force: :cascade do |t|
    t.string   "name",        limit: 32,  null: false
    t.string   "description", limit: 200
    t.string   "link",        limit: 100
    t.string   "key",         limit: 20,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "applications", ["key"], name: "index_applications_on_key", unique: true
  add_index "applications", ["name"], name: "index_applications_on_name", unique: true

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 100, null: false
    t.string   "description", limit: 200
    t.string   "link",        limit: 100
    t.string   "teacher",     limit: 100, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",      limit: 100, null: false
    t.text     "content"
    t.date     "start_date"
    t.string   "address",    limit: 150
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",        limit: 100, null: false
    t.text     "content"
    t.date     "published_at"
    t.string   "address",      limit: 150
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
