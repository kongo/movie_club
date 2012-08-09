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

ActiveRecord::Schema.define(:version => 20120809090604) do

  create_table "movies", :force => true do |t|
    t.integer  "added_by_id"
    t.string   "imdb_id",                                         :null => false
    t.string   "title"
    t.string   "director"
    t.integer  "length"
    t.string   "mpaa_rating"
    t.text     "plot"
    t.string   "poster_url"
    t.decimal  "imdb_rating",      :precision => 10, :scale => 0
    t.string   "trailer_url"
    t.integer  "year"
    t.integer  "imdb_votes_count"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "options", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "polls", :force => true do |t|
    t.integer  "owner_id"
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",             :default => "",    :null => false
    t.string   "fullname",             :default => "",    :null => false
    t.string   "email",                :default => "",    :null => false
    t.string   "encrypted_password",   :default => "",    :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "is_admin",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.integer  "option_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["poll_id", "user_id"], :name => "poll_user", :unique => true

end
