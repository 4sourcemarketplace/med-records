class CreateDiagProcs < ActiveRecord::Migration[5.2]
  def change
    create_table :diag_procs do |t|
      t.text :description
      t.datetime :moment
      t.timestamps
    end
  end
end
