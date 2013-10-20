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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20131019235353) do
=======
ActiveRecord::Schema.define(:version => 20131019233801) do
>>>>>>> 4646f9884f2697866de95b35bc7a477fd377d0b8

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

  create_table "binarys_tags", :id => false, :force => true do |t|
    t.integer "binary_id"
    t.integer "tag_id"
  end

  add_index "binarys_tags", ["binary_id", "tag_id"], :name => "index_binarys_tags_on_binary_id_and_tag_id"
  add_index "binarys_tags", ["tag_id"], :name => "index_binarys_tags_on_tag_id"

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

  create_table "pictures_tags", :id => false, :force => true do |t|
    t.integer "picture_id"
    t.integer "tag_id"
  end

  add_index "pictures_tags", ["picture_id", "tag_id"], :name => "index_pictures_tags_on_picture_id_and_tag_id"
  add_index "pictures_tags", ["tag_id"], :name => "index_pictures_tags_on_tag_id"

  create_table "sound_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.integer  "sound_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sounds", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "snd_file_name"
    t.string   "snd_content_type"
    t.integer  "snd_file_size"
    t.datetime "snd_updated_at"
  end

  create_table "sounds_tags", :id => false, :force => true do |t|
    t.integer "sound_id"
    t.integer "tag_id"
  end

  add_index "sounds_tags", ["sound_id", "tag_id"], :name => "index_sounds_tags_on_sound_id_and_tag_id"
  add_index "sounds_tags", ["tag_id"], :name => "index_sounds_tags_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "english"
    t.string   "french"
    t.string   "creole"
    t.string   "spanish"
    t.text     "english_description"
    t.text     "french_description"
    t.text     "creole_description"
    t.text     "spanish_description"
    t.boolean  "main_category"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "tags_texts", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "text_id"
  end

  add_index "tags_texts", ["tag_id", "text_id"], :name => "index_tags_texts_on_tag_id_and_text_id"
  add_index "tags_texts", ["text_id"], :name => "index_tags_texts_on_text_id"

  create_table "tags_videos", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "video_id"
  end

  add_index "tags_videos", ["tag_id", "video_id"], :name => "index_tags_videos_on_tag_id_and_video_id"
  add_index "tags_videos", ["video_id"], :name => "index_tags_videos_on_video_id"

  create_table "text_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.integer  "text_id"
    t.boolean  "published"
    t.text     "plain_text"
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

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "role"
    t.string   "lang"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_langs", :force => true do |t|
    t.string   "lang"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.integer  "video_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "item_id"
    t.datetime "date"
    t.string   "name"
    t.string   "vid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
