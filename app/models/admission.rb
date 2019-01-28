class Admission < ApplicationRecord
    has_and_belongs_to_many :patients
    has_and_belongs_to_many :symptoms
    has_and_belongs_to_many :diagnoses
    has_and_belongs_to_many :observations
end
