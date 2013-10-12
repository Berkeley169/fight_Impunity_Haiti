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

ActiveRecord::Schema.define(:version => 20131010213153) do

  create_table "binaries", :force => true do |t|
    t.string   "title"
    t.integer  "item_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "bin_file_name"
    t.string   "bin_content_type"
    t.integer  "bin_file_size"
    t.datetime "bin_updated_at"
  end

  create_table "binary_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.integer  "binary_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "bin_lang_file_name"
    t.string   "bin_lang_content_type"
    t.integer  "bin_lang_file_size"
    t.datetime "bin_lang_updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.boolean  "english"
    t.boolean  "french"
    t.boolean  "creole"
    t.boolean  "spanish"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "speaks_french"
    t.boolean  "speaks_english"
    t.boolean  "speaks_creole"
    t.boolean  "speaks_spanish"
    t.boolean  "manager"
    t.boolean  "editor"
    t.boolean  "public"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "picture_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.integer  "picture_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "sound_langs", :force => true do |t|
    t.string   "language"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sounds", :force => true do |t|
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "text_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.integer  "text_id"
    t.boolean  "published"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "txt_file_name"
    t.string   "txt_content_type"
    t.integer  "txt_file_size"
    t.datetime "txt_updated_at"
  end

  create_table "texts", :force => true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "date"
    t.string   "author"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "video_langs", :force => true do |t|
    t.string   "language"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
