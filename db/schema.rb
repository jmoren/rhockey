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

ActiveRecord::Schema.define(:version => 20101210231323) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "topage"
    t.integer  "minage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "championships", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "type_options"
    t.text     "description"
    t.integer  "category_id"
    t.boolean  "closed",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coaches", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "team_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "gender"
    t.date     "birthday"
    t.boolean  "can_play",   :default => true,  :null => false
    t.boolean  "captain",    :default => false
    t.integer  "team_id"
    t.boolean  "goalkeeper", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referis", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "players_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
