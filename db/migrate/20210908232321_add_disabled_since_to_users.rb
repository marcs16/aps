class AddDisabledSinceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :disabled_since, :string
  end
end
