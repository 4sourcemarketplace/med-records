class CreateMedOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :med_orders do |t|
      t.string :name
      t.decimal :dosage
      t.decimal :dosage2
      t.decimal :dosage3
      t.decimal :dosage4
      t.decimal :dosage5
      t.text :route
      t.timestamps
    end
  end
end
