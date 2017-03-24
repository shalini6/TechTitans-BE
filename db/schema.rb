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

ActiveRecord::Schema.define(version: 20170323081855) do

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "about"
    t.string   "photo"
    t.integer  "fee"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "institution_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "pin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "specialities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "institution_id"
    t.string   "speciality_name"
    t.string   "doctor_name"
    t.integer  "experience"
    t.integer  "rating"
    t.string   "discipline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name", limit: 50,  null: false
    t.string   "last_name",  limit: 50,  null: false
    t.string   "mobile",     limit: 10,  null: false
    t.string   "password",   limit: 40
    t.string   "gender",     limit: 1
    t.date     "dob"
    t.string   "address",    limit: 150
    t.string   "b_grp",      limit: 2
    t.string   "email",      limit: 100
    t.string   "aadhar",     limit: 12
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["email"], name: "index_patients_on_email", using: :btree
    t.index ["mobile"], name: "index_patients_on_mobile", using: :btree
  end
end
