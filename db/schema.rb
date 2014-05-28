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

ActiveRecord::Schema.define(version: 20140526111127) do

  create_table "effects", force: true do |t|
    t.string   "type_id"
    t.string   "attacker_type"
    t.string   "factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moves", force: true do |t|
    t.string   "name"
    t.integer  "power"
    t.integer  "type_id"
    t.integer  "pp"
    t.integer  "accuracy"
    t.integer  "priority"
    t.integer  "damage_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemon_moves", force: true do |t|
    t.integer  "pokemon_id"
    t.integer  "move_id"
    t.integer  "learn_method"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemon_types", force: true do |t|
    t.integer  "pokemon_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemons", force: true do |t|
    t.string   "name"
    t.integer  "hp_base"
    t.integer  "attack_base"
    t.integer  "defense_base"
    t.integer  "special_attack_base"
    t.integer  "special_defense_base"
    t.integer  "speed_base"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_memberships", force: true do |t|
    t.integer  "team_id"
    t.integer  "pokemon_id"
    t.integer  "level"
    t.integer  "ev_hp"
    t.integer  "ev_attack"
    t.integer  "ev_defense"
    t.integer  "ev_special_attack"
    t.integer  "ev_special_defense"
    t.integer  "ev_speed"
    t.integer  "iv_hp"
    t.integer  "iv_attack"
    t.integer  "iv_defense"
    t.integer  "iv_special_attack"
    t.integer  "iv_special_defense"
    t.integer  "iv_speed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
