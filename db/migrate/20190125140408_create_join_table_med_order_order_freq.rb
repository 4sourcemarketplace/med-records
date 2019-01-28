class CreateJoinTableMedOrderOrderFreq < ActiveRecord::Migration[5.2]
  def change
    create_join_table :med_orders, :order_freqs do |t|
      t.index [:med_order_id, :order_freq_id]
      t.index [:order_freq_id, :med_order_id]
    end
  end
end
