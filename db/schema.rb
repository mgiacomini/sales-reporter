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

ActiveRecord::Schema.define(version: 20170314173549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer  "wordpress_id"
    t.string   "status"
    t.string   "order_key"
    t.integer  "number"
    t.string   "payment_method"
    t.string   "payment_method_title"
    t.string   "customer_ip_address"
    t.string   "customer_user_agent"
    t.datetime "completed_at"
    t.datetime "paid_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.decimal  "shipping_total",       precision: 9, scale: 2
    t.decimal  "discount_total",       precision: 9, scale: 2
    t.decimal  "total",                precision: 9, scale: 2
    t.decimal  "total_tax",            precision: 9, scale: 2
    t.date     "wordpress_created_at"
    t.date     "wordpress_updated_at"
    t.index ["order_key"], name: "index_orders_on_order_key", unique: true, using: :btree
    t.index ["wordpress_id"], name: "index_orders_on_wordpress_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "orders"
    t.integer  "items"
    t.integer  "customers"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "wordpress_id"
    t.decimal  "sales",        precision: 9, scale: 2
    t.decimal  "tax",          precision: 9, scale: 2
    t.decimal  "shipping",     precision: 9, scale: 2
    t.decimal  "discount",     precision: 9, scale: 2
    t.index ["wordpress_id"], name: "index_reports_on_wordpress_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wordpresses", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
