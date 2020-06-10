class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :abbreviation
      t.string :description

      t.timestamps
    end
  end
end
