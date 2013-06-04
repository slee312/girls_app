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

ActiveRecord::Schema.define(:version => 20130604233649) do

  create_table "acceptances", :force => true do |t|
    t.string   "user"
    t.string   "accepted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "access_token"
    t.datetime "token_expiry_date"
  end

  create_table "exclusions", :force => true do |t|
    t.string   "user"
    t.string   "excluded"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.string   "user"
    t.string   "friend"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.string   "user1"
    t.string   "user2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rejections", :force => true do |t|
    t.string   "user"
    t.string   "rejected"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "hometown"
    t.string   "email"
    t.string   "birthday"
    t.string   "uid"
  end

end
