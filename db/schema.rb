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

ActiveRecord::Schema.define(version: 2019_01_28_104912) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.text "diagnoses"
    t.text "symptoms"
    t.text "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "admissions_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "admission_id", null: false
    t.index ["admission_id", "patient_id"], name: "index_admissions_patients_on_admission_id_and_patient_id"
    t.index ["patient_id", "admission_id"], name: "index_admissions_patients_on_patient_id_and_admission_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "allergies_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "allergy_id", null: false
    t.index ["allergy_id", "patient_id"], name: "index_allergies_patients_on_allergy_id_and_patient_id"
    t.index ["patient_id", "allergy_id"], name: "index_allergies_patients_on_patient_id_and_allergy_id"
  end

  create_table "diag_procs", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_diag_procs_on_patient_id"
  end

  create_table "diag_procs_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "diag_proc_id", null: false
    t.index ["diag_proc_id", "patient_id"], name: "index_diag_procs_patients_on_diag_proc_id_and_patient_id"
    t.index ["patient_id", "diag_proc_id"], name: "index_diag_procs_patients_on_patient_id_and_diag_proc_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_systen"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
  end

  create_table "diagnoses_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "diagnosis_id", null: false
    t.index ["diagnosis_id", "patient_id"], name: "index_diagnoses_patients_on_diagnosis_id_and_patient_id"
    t.index ["patient_id", "diagnosis_id"], name: "index_diagnoses_patients_on_patient_id_and_diagnosis_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "med_orders", force: :cascade do |t|
    t.string "name"
    t.decimal "dosage"
    t.decimal "dosage2"
    t.decimal "dosage3"
    t.decimal "dosage4"
    t.decimal "dosage5"
    t.text "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "frequency"
    t.text "unit"
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_med_orders_on_patient_id"
  end

  create_table "med_orders_order_freqs", id: false, force: :cascade do |t|
    t.integer "med_order_id", null: false
    t.integer "order_freq_id", null: false
    t.index ["med_order_id", "order_freq_id"], name: "index_med_orders_order_freqs_on_med_order_id_and_order_freq_id"
    t.index ["order_freq_id", "med_order_id"], name: "index_med_orders_order_freqs_on_order_freq_id_and_med_order_id"
  end

  create_table "med_orders_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "med_order_id", null: false
    t.index ["med_order_id", "patient_id"], name: "index_med_orders_patients_on_med_order_id_and_patient_id"
    t.index ["patient_id", "med_order_id"], name: "index_med_orders_patients_on_patient_id_and_med_order_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_observations_on_admission_id"
  end

  create_table "order_freqs", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "freq_unit"
    t.integer "med_order_id"
    t.index ["med_order_id"], name: "index_order_freqs_on_med_order_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.text "admissions"
    t.text "allergies"
    t.text "chron_conds"
    t.text "medications"
    t.text "diag_procs"
    t.text "diagnoses"
    t.text "treatments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "gender"
    t.integer "facility_id"
    t.index ["facility_id"], name: "index_patients_on_facility_id"
  end

  create_table "patients_treatments", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "treatment_id", null: false
    t.index ["patient_id", "treatment_id"], name: "index_patients_treatments_on_patient_id_and_treatment_id"
    t.index ["treatment_id", "patient_id"], name: "index_patients_treatments_on_treatment_id_and_patient_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_symptoms_on_admission_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

end
