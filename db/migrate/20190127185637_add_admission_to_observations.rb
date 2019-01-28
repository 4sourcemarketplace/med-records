class AddAdmissionToObservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :observations, :admission, foreign_key: true
  end
end
