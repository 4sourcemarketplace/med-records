class OrderFreq < ApplicationRecord
enum freq_units: [:hour]
    has_and_belongs_to_many :med_orders
end
