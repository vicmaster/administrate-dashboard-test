class TestZeroZeroOne < ActiveRecord::Migration
  def change
    create_table "categories", force: :cascade do |t|
      t.string "name"
    end

    create_table "categories_products", id: false, force: :cascade do |t|
      t.integer "product_id",  null: false
      t.integer "category_id", null: false
    end

    add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
    add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

    create_table "line_items", force: :cascade do |t|
      t.integer  "order_id"
      t.integer  "product_id"
      t.integer  "quantity",   null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
    add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

    create_table "orders", force: :cascade do |t|
      t.string   "number",          limit: 15
      t.decimal  "item_total",                 precision: 8, scale: 2, default: 0.0, null: false
      t.decimal  "total",                      precision: 8, scale: 2, default: 0.0, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "state"
      t.datetime "completed_at"
      t.integer  "bill_address_id"
      t.decimal  "payment_total",              precision: 8, scale: 2, default: 0.0
      t.string   "payment_state"
      t.string   "email"
      t.integer  "user_id"
    end

    create_table "products", force: :cascade do |t|
      t.string   "name",                                 default: "", null: false
      t.text     "description"
      t.datetime "available_on"
      t.datetime "deleated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "sku",                                  default: "", null: false
      t.decimal  "price",        precision: 8, scale: 2,              null: false
    end
  end
end
