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

ActiveRecord::Schema.define(version: 2018_12_30_152907) do

  create_table "bands", force: :cascade do |t|
    t.string "band_name"
    t.boolean "tours"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_musicians", force: :cascade do |t|
    t.integer "musician_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musician_bands", force: :cascade do |t|
    t.integer "musician_id"
    t.integer "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "instrument"
    t.string "description"
    t.integer "time_for_music"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "stars"
    t.string "comment"
    t.integer "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
