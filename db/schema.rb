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

ActiveRecord::Schema.define(version: 2021_09_07_123157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journeys", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "user_id"
    t.datetime "journey_start", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "journey_end"
    t.boolean "completed", default: false
    t.index ["route_id"], name: "index_journeys_on_route_id"
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "category"
    t.float "latitude"
    t.float "longitude"
    t.datetime "notification_start", null: false
    t.text "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "notification_end"
    t.string "location"
    t.bigint "route_id"
    t.index ["route_id"], name: "index_notifications_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "route_image_url"
    t.string "location_category"
    t.string "time"
    t.string "length"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waypoints", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.bigint "route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sequence"
    t.index ["route_id"], name: "index_waypoints_on_route_id"
  end

  add_foreign_key "journeys", "routes"
  add_foreign_key "journeys", "users"
  add_foreign_key "notifications", "routes"
  add_foreign_key "routes", "users"
  add_foreign_key "waypoints", "routes"
end
