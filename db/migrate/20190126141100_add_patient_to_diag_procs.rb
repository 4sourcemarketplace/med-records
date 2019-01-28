class AddPatientToDiagProcs < ActiveRecord::Migration[5.2]
  def change
    add_reference :diag_procs, :patient, foreign_key: true
  end
end
