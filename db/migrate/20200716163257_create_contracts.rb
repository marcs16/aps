class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :code
      t.string :contractor
      t.string :object
      t.string :supervisor
      t.string :initiation_act
      t.string :dead_line
      t.string :value
      t.string :executed_value
      t.string :execution_rate
      t.string :observations

      t.timestamps
    end
  end
end
