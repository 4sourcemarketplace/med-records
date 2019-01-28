class CreateJoinTablePatientMedication < ActiveRecord::Migration[5.2]
  def change
    create_join_table :patients, :med_orders do |t|
      t.index [:patient_id, :med_order_id]
      t.index [:med_order_id, :patient_id]
    end
  end
end
