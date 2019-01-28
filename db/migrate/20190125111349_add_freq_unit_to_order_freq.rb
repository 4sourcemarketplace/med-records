class AddFreqUnitToOrderFreq < ActiveRecord::Migration[5.2]
  def change
    add_column :order_freqs, :freq_unit, :string
  end
end
