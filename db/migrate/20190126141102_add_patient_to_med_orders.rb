class AddPatientToMedOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :med_orders, :patient, foreign_key: true
  end
end
