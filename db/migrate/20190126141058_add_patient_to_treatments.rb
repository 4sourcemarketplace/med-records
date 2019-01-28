class AddPatientToTreatments < ActiveRecord::Migration[5.2]
  def change
    add_reference :treatments, :patient, foreign_key: true
  end
end
