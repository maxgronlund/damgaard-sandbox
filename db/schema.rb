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

ActiveRecord::Schema.define(:version => 20120609105330) do

  create_table "backdrops", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "crop_params"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "body"
    t.boolean  "publish"
    t.string   "headline"
    t.string   "title_uk"
    t.string   "headline_uk"
    t.text     "body_uk"
    t.integer  "backdrop_id"
    t.string   "color_theme"
    t.text     "google_map"
    t.string   "slug"
  end

  add_index "companies", ["slug"], :name => "index_companies_on_slug", :unique => true

  create_table "contact_people", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "tlf"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.integer  "company_id"
    t.string   "image"
    t.text     "crop_params"
  end

  add_index "contact_people", ["company_id"], :name => "index_contact_people_on_company_id"

  create_table "gallery_images", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "crop_params"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  add_index "gallery_images", ["page_id"], :name => "index_gallery_images_on_page_id"

  create_table "menus", :force => true do |t|
    t.string   "title"
    t.string   "title_uk"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  add_index "menus", ["company_id"], :name => "index_menus_on_company_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title_uk"
    t.text     "body_uk"
    t.integer  "backdrop_id"
    t.integer  "menu_id"
    t.boolean  "show_map"
    t.string   "slug"
    t.integer  "position"
    t.string   "page_type"
  end

  add_index "pages", ["company_id"], :name => "index_pages_on_company_id"
  add_index "pages", ["menu_id"], :name => "index_pages_on_menu_id"
  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "role"
    t.integer  "sign_in_count"
    t.string   "image"
    t.text     "crop_params"
    t.boolean  "grid"
    t.string   "auth_token"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
