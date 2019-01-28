class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.datetime :moment
      t.text :diagnoses
      t.text :symptoms
      t.text :observations
      t.timestamps
    end
  end
end
