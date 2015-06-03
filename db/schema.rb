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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150528202038) do

  create_table "book_courses", force: :cascade do |t|
    t.string   "course_id"
    t.string   "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_keywords", force: :cascade do |t|
    t.string   "keyword_id"
    t.string   "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_professors", force: :cascade do |t|
    t.string   "book_id"
    t.string   "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.text     "google_description"
    t.string   "type"
    t.integer  "appearances_on_list"
    t.string   "img_url"
    t.string   "isbn_13"
    t.string   "year_published"
    t.string   "edition"
    t.string   "author"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name_and_title"
    t.string   "user_id"
    t.string   "department_id"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "professor_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "user_id"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pdescriptions", force: :cascade do |t|
    t.string   "book_id"
    t.string   "description"
    t.string   "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "review"
    t.integer  "rating"
    t.string   "book_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
