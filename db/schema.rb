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

ActiveRecord::Schema.define(version: 20140402105002) do

  create_table "activities", force: true do |t|
    t.integer "trackable_id"
    t.string "trackable_type"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "key"
    t.text "parameters"
    t.integer "recipient_id"
    t.string "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "offline_events", force: true do |t|
    t.string "school_name"
    t.text "school_address"
    t.string "event_name"
    t.text "event_description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "volunteers_present"
  end

  create_table "photos", force: true do |t|
    t.string "imageable_type", limit: 30
    t.integer "imageable_id"
    t.integer "flickr_photo_id", limit: 8
    t.string "image_file_name"
    t.string "image_content_type"
    t.string "title", limit: 100
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["flickr_photo_id"], name: "index_photos_on_flickr_photo_id", using: :btree

  create_table "plastic_collection_events", force: true do |t|
    t.float "plastic_weight"
    t.float "money_given"
    t.text "volunteers_present"
    t.integer "plastic_collection_source_id"
    t.string "quality_remark"
    t.text "feedback"
    t.integer "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at"
    t.datetime "end_at"
  end

  create_table "plastic_collection_sources", force: true do |t|
    t.string "name"
    t.text "address"
    t.string "contact_person"
    t.string "phone_no_1", limit: 15
    t.string "phone_no_2", limit: 15
    t.string "website"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentation_types", force: true do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", force: true do |t|
    t.string "presented_by"
    t.integer "audience_count"
    t.text "summary"
    t.text "authorities_present"
    t.integer "presentation_type_id"
    t.integer "school_id"
    t.string "followup_volunteer"
    t.string "followup_volunteer_mno"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at"
    t.datetime "end_at"
  end

  create_table "principal_details", force: true do |t|
    t.integer "school_id"
    t.string "name"
    t.string "detail_status", limit: 1, default: "A"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "in_office_since"
  end

  create_table "program_states", force: true do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_volunteers", force: true do |t|
    t.string "name"
    t.text "interest"
    t.text "responsibility"
    t.string "email"
    t.string "mobile", limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string "name"
    t.string "description"
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
    t.integer "school_id"
    t.integer "user_id"
    t.integer "school_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_media", force: true do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_plastic_collection_sources", force: true do |t|
    t.integer "schoold_id"
    t.integer "plastic_collection_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_roles", force: true do |t|
    t.string "role"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_types", force: true do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_volunteers", force: true do |t|
    t.boolean "volunteer"
    t.string "mobile", limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "school_id"
    t.string "name"
    t.string "email"
  end

  create_table "schools", force: true do |t|
    t.text "address"
    t.integer "school_type_id"
    t.integer "program_state_id"
    t.integer "total_students"
    t.integer "school_medium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "number_of_collections"
    t.integer "plastic_collected"
    t.integer "green_fund"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number", limit: 15
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
