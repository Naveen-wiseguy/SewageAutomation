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

ActiveRecord::Schema.define(version: 20150226112139) do

  create_table "manhole_sensors", force: true do |t|
    t.string   "location"
    t.integer  "limit"
    t.boolean  "alert"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pumping_stations", force: true do |t|
    t.integer  "volume"
    t.boolean  "valve_open"
    t.string   "location"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity"
    t.boolean  "alert"
    t.boolean  "second_valve_open"
    t.integer  "treatment_plant_id"
  end

  add_index "pumping_stations", ["treatment_plant_id"], name: "index_pumping_stations_on_treatment_plant_id"

  create_table "treatment_plants", force: true do |t|
    t.integer  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity"
    t.boolean  "alert"
  end

end
