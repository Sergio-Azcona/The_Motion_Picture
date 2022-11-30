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

ActiveRecord::Schema.define(version: 2022_11_30_052118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.integer "best_director_oscars"
    t.boolean "multiple_best_director_nominations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "release_year"
    t.boolean "best_picture_oscar"
    t.bigint "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_films_on_director_id"
  end

  create_table "filmsses", force: :cascade do |t|
    t.string "name"
    t.integer "release_year"
    t.integer "running_time"
    t.boolean "best_picture_oscar"
    t.bigint "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_filmsses_on_director_id"
  end

  add_foreign_key "films", "directors"
  add_foreign_key "filmsses", "directors"
end
