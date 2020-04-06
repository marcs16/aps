class CreateMaintainces < ActiveRecord::Migration[5.2]
  def change
    create_table :maintainces do |t|
      t.string :name
      t.text :description
      t.date :date
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
