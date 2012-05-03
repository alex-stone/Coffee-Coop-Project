class CreateCooperatives < ActiveRecord::Migration
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.timestamps
    end
  end
end
