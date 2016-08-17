ActiveRecord::Schema.define(version: 20160816204200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.integer  "floor_count"
    t.integer  "floor_area"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "library_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_library_users_on_library_id", using: :btree
    t.index ["user_id"], name: "index_library_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "library_users", "libraries"
  add_foreign_key "library_users", "users"
end
