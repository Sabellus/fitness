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

ActiveRecord::Schema.define(version: 20180420174208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_exes_on_deleted_at"
  end

  create_table "exes_programs", force: :cascade do |t|
    t.bigint "ex_id"
    t.bigint "program_id"
    t.index ["ex_id"], name: "index_exes_programs_on_ex_id"
    t.index ["program_id"], name: "index_exes_programs_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
