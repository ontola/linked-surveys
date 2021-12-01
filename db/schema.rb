# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_29_085637) do

  create_table "coupon_batches", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "display_name"
    t.integer "coupon_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_coupon_batches_on_survey_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.integer "coupon_batch_id", null: false
    t.string "token"
    t.datetime "used_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_batch_id"], name: "index_coupons_on_coupon_batch_id"
  end

  create_table "custom_form_fields", force: :cascade do |t|
    t.integer "custom_form_id", null: false
    t.integer "form_field_type", null: false
    t.string "title"
    t.text "description"
    t.text "helper_text"
    t.string "default_value"
    t.integer "max_count"
    t.integer "min_count"
    t.integer "max_inclusive"
    t.integer "min_inclusive"
    t.integer "max_length"
    t.integer "min_length"
    t.string "pattern"
    t.string "predicate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order", default: 0, null: false
    t.string "placeholder"
    t.index ["custom_form_id"], name: "index_custom_form_fields_on_custom_form_id"
  end

  create_table "custom_forms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_custom_forms_on_user_id"
  end

  create_table "field_options", force: :cascade do |t|
    t.integer "custom_form_field_id", null: false
    t.string "label"
    t.string "predicate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order", default: 0, null: false
    t.index ["custom_form_field_id"], name: "index_field_options_on_custom_form_field_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.string "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "otp_secrets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id", null: false
    t.string "otp_secret_key", null: false
    t.boolean "active", default: false
    t.index ["owner_id"], name: "index_otp_secrets_on_owner_id", unique: true
  end

  create_table "submission_values", force: :cascade do |t|
    t.integer "submission_id", null: false
    t.string "predicate", null: false
    t.text "value", null: false
    t.string "value_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_id"], name: "index_submission_values_on_submission_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "session_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "coupon"
    t.index ["survey_id"], name: "index_submissions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "custom_form_id"
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "reward", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["custom_form_id"], name: "index_surveys_on_custom_form_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coupon_batches", "surveys"
  add_foreign_key "coupons", "coupon_batches"
  add_foreign_key "custom_form_fields", "custom_forms"
  add_foreign_key "custom_forms", "users"
  add_foreign_key "field_options", "custom_form_fields"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "submission_values", "submissions"
  add_foreign_key "submissions", "surveys"
  add_foreign_key "surveys", "custom_forms"
  add_foreign_key "surveys", "users"
end
