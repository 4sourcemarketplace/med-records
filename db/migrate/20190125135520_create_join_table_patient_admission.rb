class CreateJoinTablePatientAdmission < ActiveRecord::Migration[5.2]
  def change
    create_join_table :patients, :admissions do |t|
      t.index [:patient_id, :admission_id]
      t.index [:admission_id, :patient_id]
    end
  end
end
