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

ActiveRecord::Schema.define(version: 20170327073608) do

  create_table "clinicals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "institution_id"
    t.string   "speciality_name"
    t.string   "doctor_id"
    t.string   "doctor_name"
    t.integer  "experience"
    t.string   "department"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "about",           limit: 65535
    t.string   "photo"
    t.string   "password_digest"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "email"
    t.string   "website"
    t.string   "contact_number"
    t.integer  "rating"
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "institution_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "pin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "password_digest"
    t.string   "gender"
    t.date     "dob"
    t.string   "address"
    t.string   "blood_grp"
    t.string   "email"
    t.string   "aadhar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["mobile"], name: "index_patients_on_mobile", using: :btree
  end

end
