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

ActiveRecord::Schema.define(version: 2018_08_29_153830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string "status", default: "pending"
    t.string "request"
    t.bigint "requester_id"
    t.bigint "responder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requester_id"], name: "index_connections_on_requester_id"
    t.index ["responder_id"], name: "index_connections_on_responder_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "user_id"
    t.string "type"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_media_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "connection_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_messages_on_connection_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "skill_users", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_users_on_skill_id"
    t.index ["user_id"], name: "index_skill_users_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_skills", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_tag_skills_on_skill_id"
    t.index ["tag_id"], name: "index_tag_skills_on_tag_id"
  end

  create_table "tag_users", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tag_users_on_tag_id"
    t.index ["user_id"], name: "index_tag_users_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "profile_photo"
    t.string "location"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "connections", "users", column: "requester_id"
  add_foreign_key "connections", "users", column: "responder_id"
  add_foreign_key "media", "users"
  add_foreign_key "messages", "connections"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "skill_users", "skills"
  add_foreign_key "skill_users", "users"
  add_foreign_key "tag_skills", "skills"
  add_foreign_key "tag_skills", "tags"
  add_foreign_key "tag_users", "tags"
  add_foreign_key "tag_users", "users"
end
