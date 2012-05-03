class TransactionsAddCoopcenters < ActiveRecord::Migration
  def up
    add_column :transactions, :cooperative, :string
  end

  def down
    remove_column :transactions, :cooperative
  end
end
