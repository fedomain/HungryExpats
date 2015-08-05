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

ActiveRecord::Schema.define(version: 20150731200349) do

  create_table "buildings", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "city_area_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",              limit: 255
    t.string   "last_name",               limit: 255
    t.integer  "age",                     limit: 4
    t.string   "phone",                   limit: 255
    t.string   "email",                   limit: 255
    t.string   "username",                limit: 255
    t.string   "password_digest",         limit: 255
    t.string   "phone_verification_code", limit: 255
    t.boolean  "has_agreed",              limit: 1,   default: false
    t.boolean  "is_active",               limit: 1,   default: true
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "dish_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.float    "price",            limit: 24
    t.string   "picture",          limit: 255
    t.integer  "spiciness",        limit: 4
    t.boolean  "is_available",     limit: 1,     default: true
    t.boolean  "has_options",      limit: 1,     default: false
    t.boolean  "is_active",        limit: 1,     default: true
    t.integer  "restaurant_id",    limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "dish_category_id", limit: 4
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "food_styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.integer  "day",           limit: 4
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "opening_hours", ["restaurant_id"], name: "index_opening_hours_on_restaurant_id", using: :btree

  create_table "order_dishes", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "dish_id",    limit: 4
    t.integer  "quantity",   limit: 4
    t.float    "price",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "order_dishes", ["dish_id"], name: "index_order_dishes_on_dish_id", using: :btree
  add_index "order_dishes", ["order_id"], name: "index_order_dishes_on_order_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_no",         limit: 255
    t.integer  "customer_id",      limit: 4
    t.integer  "restaurant_id",    limit: 4
    t.string   "address",          limit: 255
    t.string   "city_area",        limit: 255
    t.string   "building",         limit: 255
    t.string   "city",             limit: 255
    t.string   "province",         limit: 255
    t.string   "country",          limit: 255
    t.float    "delivery_charge",  limit: 24
    t.float    "price_adjustment", limit: 24
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_deleted",       limit: 1,   default: false
    t.integer  "order_status_id",  limit: 4
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.string   "address",         limit: 255
    t.string   "picture",         limit: 255
    t.string   "phone_1",         limit: 255
    t.string   "phone_2",         limit: 255
    t.string   "qq",              limit: 255
    t.string   "qr_code",         limit: 255
    t.integer  "minimum_order",   limit: 4
    t.integer  "delivery_charge", limit: 4
    t.integer  "star_rating",     limit: 4
    t.boolean  "is_active",       limit: 1,     default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "building_id",     limit: 4
    t.integer  "food_style_id",   limit: 4
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "opening_hours", "restaurants"
  add_foreign_key "order_dishes", "dishes"
  add_foreign_key "order_dishes", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "restaurants"
end
