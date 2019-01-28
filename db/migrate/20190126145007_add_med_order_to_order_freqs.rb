class AddMedOrderToOrderFreqs < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_freqs, :med_order, foreign_key: true
  end
end
