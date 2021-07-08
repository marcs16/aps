class AddLitValueToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :lit_value, :string
  end
end
