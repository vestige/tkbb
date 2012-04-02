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

ActiveRecord::Schema.define(:version => 20120402135950) do

  create_table "climbings", :force => true do |t|
    t.integer  "user_id_id"
    t.integer  "gym_id_id"
    t.string   "comment"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "climbings", ["gym_id_id"], :name => "index_climbings_on_gym_id_id"
  add_index "climbings", ["user_id_id"], :name => "index_climbings_on_user_id_id"

  create_table "gyms", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
