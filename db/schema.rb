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

ActiveRecord::Schema.define(version: 2019_09_28_060706) do

  create_table "details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "open"
    t.time "close"
    t.string "phone_number"
    t.string "address"
    t.text "official_url"
    t.integer "membership", default: 0
    t.string "rate_plan"
    t.bigint "powder_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["powder_room_id"], name: "index_details_on_powder_room_id"
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "dresser", default: "-", null: false
    t.string "body_mirror", default: "-", null: false
    t.string "makeup_mirror", default: "-", null: false
    t.string "wifi", default: "-", null: false
    t.string "fitting_booth", default: "-", null: false
    t.string "washstands", default: "-", null: false
    t.string "luggage_storage", default: "-", null: false
    t.string "outlet", default: "-", null: false
    t.string "dust_box", default: "-", null: false
    t.string "waiting_sofa", default: "-", null: false
    t.string "rental"
    t.string "others"
    t.bigint "powder_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["powder_room_id"], name: "index_facilities_on_powder_room_id"
  end

  create_table "powder_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "rate", null: false
    t.float "lat", limit: 53, null: false
    t.float "lng", limit: 53, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_powder_rooms_on_ancestry"
    t.index ["user_id"], name: "index_powder_rooms_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "details", "powder_rooms"
  add_foreign_key "facilities", "powder_rooms"
end
