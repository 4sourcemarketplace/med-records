class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mr
      t.datetime :dob
      t.text :admissions
      t.text :allergies
      t.text :chron_conds
      t.text :medications
      t.text :diag_procs
      t.text :diagnoses
      t.text :treatments
      t.timestamps
    end
  end
end
