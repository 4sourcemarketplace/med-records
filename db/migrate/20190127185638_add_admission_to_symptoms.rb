class AddAdmissionToSymptoms < ActiveRecord::Migration[5.2]
  def change
    add_reference :symptoms, :admission, foreign_key: true
  end
end
