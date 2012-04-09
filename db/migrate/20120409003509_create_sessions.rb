class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :uname
      t.string :uemail

      t.timestamps
    end
  end
end
