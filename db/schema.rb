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

ActiveRecord::Schema.define(version: 20150104205128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_levels", force: true do |t|
    t.integer  "code"
    t.string   "description"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagrams", force: true do |t|
    t.integer  "users_id"
    t.integer  "institution_id"
    t.integer  "created_by",             null: false
    t.string   "name"
    t.string   "category"
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_format"
  end

  add_index "diagrams", ["institution_id"], name: "index_diagrams_on_institution_id", using: :btree

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_diagrams", force: true do |t|
    t.integer  "user_id"
    t.integer  "diagram_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_diagrams", ["diagram_id"], name: "index_user_diagrams_on_diagram_id", using: :btree
  add_index "user_diagrams", ["user_id"], name: "index_user_diagrams_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "institution_id"
    t.integer  "access_level_id"
    t.boolean  "super_admin",            default: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["access_level_id"], name: "index_users_on_access_level_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["institution_id"], name: "index_users_on_institution_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
