class Patient < ApplicationRecord
cattr_accessor :current_user
has_and_belongs_to_many :treatments
has_and_belongs_to_many :facilities
has_and_belongs_to_many :med_orders
has_and_belongs_to_many :allergies
has_and_belongs_to_many :admissions
has_and_belongs_to_many :diagnoses
has_and_belongs_to_many :diag_procs
enum genders: { MALE:0, FEMALE:1, OTHER:2 }

def self.current_user
  Thread.current[:user]
end

def self.current_user=(user)
  Thread.current[:user] = user
end
end
