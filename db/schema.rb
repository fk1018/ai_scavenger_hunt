# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_17_172506) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "location"
    t.integer "num_items"
    t.integer "time_limit"
    t.integer "penalty"
    t.string "scoring_mode"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_games_on_uuid"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_items_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name"
    t.boolean "admin"
    t.integer "total_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "item_id", null: false
    t.string "photo"
    t.boolean "correct"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_submissions_on_item_id"
    t.index ["player_id"], name: "index_submissions_on_player_id"
  end

  add_foreign_key "items", "games"
  add_foreign_key "players", "games"
  add_foreign_key "submissions", "items"
  add_foreign_key "submissions", "players"
end
