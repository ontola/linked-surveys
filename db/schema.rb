# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_12_150744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gist"
  enable_extension "hstore"
  enable_extension "ltree"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "edges", id: :serial, force: :cascade do |t|
    t.integer "publisher_id", null: false
    t.integer "parent_id"
    t.string "owner_type"
    t.ltree "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "pinned_at"
    t.datetime "last_activity_at"
    t.datetime "trashed_at"
    t.boolean "is_published", default: false
    t.hstore "children_counts", default: {}
    t.integer "follows_count", default: 0, null: false
    t.datetime "expires_at"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.boolean "confirmed", default: false, null: false
    t.uuid "root_id", null: false
    t.integer "fragment", null: false
    t.integer "creator_id", null: false
    t.boolean "primary"
    t.integer "attachments_count", default: 0, null: false
    t.string "session_id"
    t.index ["is_published"], name: "index_edges_on_is_published"
    t.index ["owner_type"], name: "index_edges_on_owner_type"
    t.index ["parent_id", "creator_id"], name: "index_edges_on_parent_id_and_creator_id", unique: true, where: "(\"primary\" IS TRUE)"
    t.index ["path"], name: "index_edges_on_path", using: :gist
    t.index ["root_id", "fragment"], name: "index_edges_on_root_id_and_fragment", unique: true
    t.index ["root_id", "path"], name: "index_edges_on_root_id_and_path"
    t.index ["root_id"], name: "index_edges_on_root_id"
    t.index ["trashed_at"], name: "index_edges_on_trashed_at"
    t.index ["uuid"], name: "index_edges_on_uuid", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "edge_id", null: false
    t.string "predicate", null: false
    t.boolean "boolean"
    t.string "string"
    t.text "text"
    t.datetime "datetime"
    t.bigint "integer"
    t.uuid "linked_edge_id"
    t.integer "order", default: 0, null: false
    t.string "iri"
    t.string "language"
    t.uuid "root_id", null: false
    t.index ["edge_id", "predicate", "integer"], name: "index_properties_on_edge_id_and_predicate_and_integer"
    t.index ["edge_id"], name: "index_properties_on_edge_id"
    t.index ["root_id", "edge_id", "linked_edge_id", "predicate", "order"], name: "order_index"
    t.index ["root_id", "edge_id"], name: "index_properties_on_root_id_and_edge_id"
    t.index ["root_id"], name: "index_properties_on_root_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: ""
    t.string "encrypted_password", limit: 255, default: ""
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unconfirmed_email", limit: 255
    t.boolean "finished_intro", default: false
    t.text "redirect_url"
    t.text "access_tokens"
    t.integer "follows_email", default: 0, null: false
    t.boolean "follows_mobile", default: true, null: false
    t.integer "memberships_email", default: 1, null: false
    t.boolean "memberships_mobile", default: true, null: false
    t.integer "created_email", default: 1, null: false
    t.boolean "created_mobile", default: true, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birthday"
    t.datetime "last_accepted"
    t.boolean "has_analytics", default: true
    t.text "omni_info"
    t.integer "gender"
    t.integer "hometown"
    t.string "time_zone", default: "UTC"
    t.string "language", default: "nl"
    t.string "country", default: "NL"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "notifications_viewed_at"
    t.integer "decisions_email", default: 3, null: false
    t.integer "news_email", default: 3, null: false
    t.integer "reactions_email", default: 3, null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.boolean "hide_last_name", default: false
    t.boolean "is_public", default: true
    t.boolean "show_feed", default: true
    t.text "about", default: ""
    t.integer "attachments_count", default: 0, null: false
    t.string "display_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["show_feed"], name: "index_users_on_show_feed"
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

end
