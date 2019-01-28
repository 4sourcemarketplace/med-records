class CreateJoinTablePatientDiagnosis < ActiveRecord::Migration[5.2]
  def change
    create_join_table :patients, :diagnoses do |t|
      t.index [:patient_id, :diagnosis_id]
      t.index [:diagnosis_id, :patient_id]
    end
  end
end
