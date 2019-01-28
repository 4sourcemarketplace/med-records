class MedOrder < ApplicationRecord
enum medication_routes:[ :PO, :IM, :SC]
enum mass_units:[:MG]
  has_and_belongs_to_many :patients
  has_and_belongs_to_many :order_freqs

end
