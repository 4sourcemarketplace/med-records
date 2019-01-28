class JoinTablePatientDiagProc < ActiveRecord::Migration[5.2]
  def change
    create_join_table :patients, :diag_procs do |t|
      t.index [:patient_id, :diag_proc_id]
      t.index [:diag_proc_id, :patient_id]
    end
  end
end
