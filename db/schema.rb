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

ActiveRecord::Schema.define(version: 2019_10_14_170629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "label_associations", force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_label_associations_on_label_id"
    t.index ["task_id"], name: "index_label_associations_on_task_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_labels_on_task_id"
    t.index ["user_id"], name: "index_labels_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.text "content", null: false
    t.string "status", null: false
    t.string "priority", null: false
    t.date "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "label_id"
    t.index ["label_id"], name: "index_tasks_on_label_id"
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "user_type", default: "user"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "label_associations", "labels"
  add_foreign_key "label_associations", "tasks"
  add_foreign_key "labels", "tasks"
  add_foreign_key "labels", "users"
  add_foreign_key "tasks", "labels"
  add_foreign_key "tasks", "users"
end
