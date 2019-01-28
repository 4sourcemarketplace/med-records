class AddPatientToAllergies < ActiveRecord::Migration[5.2]
  def change
    add_reference :allergies, :patient, foreign_key: true
  end
end
