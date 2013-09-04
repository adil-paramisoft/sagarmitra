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

ActiveRecord::Schema.define(version: 20130904125031) do

  create_table "plastic_collection_events", force: true do |t|
    t.float    "plastic_weight"
    t.float    "money_given"
    t.text     "volunteers_present"
    t.integer  "plastic_collection_source_id"
    t.datetime "date"
    t.string   "quality_remark"
    t.text     "feedback"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plastic_collection_sources", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_person"
    t.integer  "phone_no_1"
    t.integer  "phone_no_2"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentation_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", force: true do |t|
    t.string   "presented_by"
    t.datetime "date"
    t.integer  "audience_count"
    t.text     "summary"
    t.text     "authorities_present"
    t.integer  "presentation_type_id"
    t.integer  "school_id"
    t.string   "followup_volunteer"
    t.integer  "followup_volunteer_mno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_states", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_volunteers", force: true do |t|
    t.string   "name"
    t.text     "interest"
    t.text     "responsibility"
    t.string   "email"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "school_contacts", force: true do |t|
    t.integer  "school_id"
    t.integer  "user_id"
    t.integer  "schoold_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_media", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_plastic_collection_sources", force: true do |t|
    t.integer  "schoold_id"
    t.integer  "plastic_collection_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_roles", force: true do |t|
    t.string   "role"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_volunteers", force: true do |t|
    t.string   "school_name"
    t.string   "school_address"
    t.integer  "user_id"
    t.integer  "school_medium_id"
    t.string   "no_of_students"
    t.boolean  "volunteer"
    t.integer  "school_type_id"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.text     "address"
    t.integer  "school_type_id"
    t.integer  "program_state_id"
    t.integer  "total_students"
    t.integer  "school_medium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "mobile_number"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
