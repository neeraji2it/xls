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

ActiveRecord::Schema.define(version: 20160915115543) do

  create_table "trainers", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "profile_type", limit: 255
    t.string   "industry",     limit: 255
    t.decimal  "experience",               precision: 10
    t.string   "expertise",    limit: 255
    t.string   "geography",    limit: 255
    t.float    "rating",       limit: 24
    t.string   "references",   limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "avatar",       limit: 255
  end

end
