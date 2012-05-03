class CentersCoopid < ActiveRecord::Migration
  def up
    add_column :centers, :cooperative_id, :integer
  end

  def down
    remove_column :centers, :cooperative_id, :integer
  end
end
