class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :type_of_device
      t.string :number
      t.string :operative_system
      t.string :processor
      t.string :memory
      t.string :mac

      t.timestamps
    end
  end
end
