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

ActiveRecord::Schema.define(version: 20140422212639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "note_id",    null: false
    t.integer  "author_id",  null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["note_id"], name: "index_comments_on_note_id", using: :btree

  create_table "friend_requests", force: true do |t|
    t.integer  "in_friend_id",  null: false
    t.integer  "out_friend_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_requests", ["in_friend_id", "out_friend_id"], name: "index_friend_requests_on_in_friend_id_and_out_friend_id", unique: true, using: :btree
  add_index "friend_requests", ["in_friend_id"], name: "index_friend_requests_on_in_friend_id", using: :btree
  add_index "friend_requests", ["out_friend_id"], name: "index_friend_requests_on_out_friend_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "in_friend_id",  null: false
    t.integer  "out_friend_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["in_friend_id", "out_friend_id"], name: "index_friendships_on_in_friend_id_and_out_friend_id", unique: true, using: :btree
  add_index "friendships", ["in_friend_id"], name: "index_friendships_on_in_friend_id", using: :btree
  add_index "friendships", ["out_friend_id"], name: "index_friendships_on_out_friend_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "owner_id",   null: false
    t.integer  "note_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["note_id"], name: "index_likes_on_note_id", using: :btree
  add_index "likes", ["owner_id", "note_id"], name: "index_likes_on_owner_id_and_note_id", unique: true, using: :btree
  add_index "likes", ["owner_id"], name: "index_likes_on_owner_id", using: :btree

  create_table "note_tags", force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "note_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_tags", ["note_id"], name: "index_note_tags_on_note_id", using: :btree
  add_index "note_tags", ["tag_id", "note_id"], name: "index_note_tags_on_tag_id_and_note_id", unique: true, using: :btree
  add_index "note_tags", ["tag_id"], name: "index_note_tags_on_tag_id", using: :btree

  create_table "notebooks", force: true do |t|
    t.text     "name",       null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notebooks", ["owner_id"], name: "index_notebooks_on_owner_id", using: :btree

  create_table "notes", force: true do |t|
    t.string   "title",       default: "Untitled Note"
    t.text     "body"
    t.integer  "author_id",                             null: false
    t.integer  "notebook_id",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["author_id"], name: "index_notes_on_author_id", using: :btree
  add_index "notes", ["notebook_id"], name: "index_notes_on_notebook_id", using: :btree
  add_index "notes", ["title"], name: "index_notes_on_title", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notifiable_id"], name: "index_notifications_on_notifiable_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.text     "name",       null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["owner_id", "name"], name: "index_tags_on_owner_id_and_name", unique: true, using: :btree
  add_index "tags", ["owner_id"], name: "index_tags_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
