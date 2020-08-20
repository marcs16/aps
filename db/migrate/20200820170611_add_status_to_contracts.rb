class AddStatusToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :status, :string
  end
end
