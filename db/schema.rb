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

ActiveRecord::Schema.define(version: 2018_01_23_144557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeds", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.datetime "last_fetched"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
    t.integer "group_id"
    t.bigint "user_id"
    t.index ["user_id", "url"], name: "index_feeds_on_user_id_and_url", unique: true
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "permalink"
    t.text "body"
    t.integer "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published"
    t.boolean "is_read"
    t.boolean "keep_unread", default: false
    t.boolean "is_starred", default: false
    t.text "entry_id"
    t.index ["entry_id", "feed_id"], name: "index_stories_on_entry_id_and_feed_id", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "setup_complete"
    t.string "api_key"
    t.string "email"
    t.index "lower((email)::text)", name: "index_users_on_LOWER_email", unique: true
  end

  add_foreign_key "feeds", "users"
end
