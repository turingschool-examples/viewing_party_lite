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

ActiveRecord::Schema.define(version: 2022_02_01_000015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cast_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "view_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invites_on_user_id"
    t.index ["view_party_id"], name: "index_invites_on_view_party_id"
  end

  create_table "movie_casts", force: :cascade do |t|
    t.bigint "cast_member_id"
    t.bigint "movie_id"
    t.string "character_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cast_member_id"], name: "index_movie_casts_on_cast_member_id"
    t.index ["movie_id"], name: "index_movie_casts_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.integer "run_time"
    t.string "poster_file_path"
    t.string "summary"
    t.string "genres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "movie_id"
    t.string "reviewer_name"
    t.string "review_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "view_parties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.date "start_date"
    t.time "start_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_view_parties_on_movie_id"
    t.index ["user_id"], name: "index_view_parties_on_user_id"
  end

  add_foreign_key "invites", "users"
  add_foreign_key "invites", "view_parties"
  add_foreign_key "movie_casts", "cast_members"
  add_foreign_key "movie_casts", "movies"
  add_foreign_key "reviews", "movies"
  add_foreign_key "view_parties", "movies"
  add_foreign_key "view_parties", "users"
end
