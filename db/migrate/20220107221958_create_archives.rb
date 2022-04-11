class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :archives do |t|
      t.references :contracts, foreign_key: true

      t.timestamps
    end
  end
end
