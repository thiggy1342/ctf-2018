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

ActiveRecord::Schema.define(version: 2018_10_09_144251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.string "user1"
    t.string "user2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display_html?", default: false
    t.string "hash_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "to"
    t.string "from"
    t.string "content"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "user_generated"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

end
