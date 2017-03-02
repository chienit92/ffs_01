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

ActiveRecord::Schema.define(version: 20170302025618) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "combo_products", force: :cascade do |t|
    t.integer  "combo_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_combo_products_on_combo_id"
    t.index ["product_id"], name: "index_combo_products_on_product_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.boolean  "active"
    t.float    "com_value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "description"
    t.float    "dis_value"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "location_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "location_udx", unique: true
    t.index ["descendant_id"], name: "location_idx"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.float    "unit_price"
    t.integer  "unti_quantity"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "rec_name"
    t.string   "rec_addr"
    t.string   "rec_phone"
    t.float    "total"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "discount_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["discount_id"], name: "index_orders_on_discount_id"
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.boolean  "status"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_shops_on_location_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "position"
    t.integer  "shop_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["shop_id"], name: "index_staffs_on_shop_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "phone"
    t.integer  "point"
    t.integer  "membership"
    t.boolean  "is_admin"
    t.integer  "location_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["location_id"], name: "index_users_on_location_id"
  end

end
