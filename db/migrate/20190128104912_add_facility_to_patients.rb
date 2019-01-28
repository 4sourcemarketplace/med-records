class AddFacilityToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :facility, foreign_key: true
  end
end
