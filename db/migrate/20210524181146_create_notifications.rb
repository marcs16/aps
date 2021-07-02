class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :notification_origin
      t.string :origin_id
      t.integer :user_id, array:true
      t.timestamps
    end
  end
end
