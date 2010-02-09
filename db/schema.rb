# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100209094933) do

  create_table "job_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samples", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "original_image_file_name"
    t.string   "original_image_content_type"
    t.integer  "original_image_file_size"
    t.string   "processed_image_file_name"
    t.string   "processed_image_content_type"
    t.integer  "processed_image_file_size"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "confirmed",         :default => false, :null => false
    t.boolean  "enabled",           :default => false, :null => false
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "phone"
    t.integer  "permission_level",  :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "users_email_index", :unique => true

end
