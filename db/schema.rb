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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120502225554) do

  create_table "centers", :force => true do |t|
    t.string   "name"
    t.string   "cooperative"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "cooperative_id"
  end

  create_table "cooperatives", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "uname"
    t.string   "uemail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "producer"
    t.string   "code"
    t.datetime "date"
    t.string   "center"
    t.integer  "lot_number"
    t.integer  "sack_number"
    t.integer  "gross_weight"
    t.integer  "tare"
    t.integer  "net_weight"
    t.integer  "price"
    t.text     "comments"
    t.string   "delivery_form"
    t.string   "quality"
    t.string   "classes"
    t.integer  "s_f"
    t.integer  "bitten"
    t.integer  "bare"
    t.integer  "green"
    t.integer  "drill"
    t.integer  "mold"
    t.integer  "gqmd"
    t.integer  "total"
    t.string   "received_by"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "cooperative"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role",        :default => "guest"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "lang",        :default => "en"
    t.string   "cooperative"
    t.string   "center"
  end

end
