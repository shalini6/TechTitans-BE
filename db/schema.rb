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

ActiveRecord::Schema.define(version: 20170328053301) do

  create_table "appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "patient_id"
    t.integer  "timeslot_id"
    t.time     "BeginTime"
    t.time     "EndTime"
    t.date     "date"
    t.boolean  "mode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
    t.index ["timeslot_id"], name: "index_appointments_on_timeslot_id", using: :btree
  end

  create_table "clinical_services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "institution_id"
    t.string   "speciality_name"
    t.string   "doctor_id"
    t.string   "doctor_name"
    t.integer  "experience"
    t.integer  "rating"
    t.string   "discipline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

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

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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

  create_table "timeslots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "institution_id"
    t.string   "service"
    t.integer  "service_id"
    t.string   "day"
    t.time     "BeginTime"
    t.time     "EndTime"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_timeslots_on_institution_id", using: :btree
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "timeslots"
  add_foreign_key "timeslots", "institutions"
end
