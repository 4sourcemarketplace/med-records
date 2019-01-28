class AddFreqUnitToMedOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :med_orders, :frequency, :text
    add_column :med_orders, :unit, :text
  end
end
