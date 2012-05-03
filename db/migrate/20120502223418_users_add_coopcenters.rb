class UsersAddCoopcenters < ActiveRecord::Migration
  def up
    add_column :users, :cooperative_id, :integer
    add_column :users, :center_id, :integer
  end

  def down
    remove_column :users, :cooperative_id
    remove_column :users, :center_id
  end
end
