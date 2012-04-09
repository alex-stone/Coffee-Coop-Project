class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :producer
      t.string :code
      t.datetime :date
      t.string :center
      t.integer :lot_number
      t.integer :sack_number
      t.integer :gross_weight
      t.integer :tare
      t.integer :net_weight
      t.integer :price
      t.text :comments
      t.string :delivery_form
      t.string :quality
      t.string :classes
      t.integer :s_f
      t.integer :bitten
      t.integer :bare
      t.integer :green
      t.integer :drill
      t.integer :mold
      t.integer :gqmd
      t.integer :total
      t.string :received_by
      t.integer :user_id

      t.timestamps
    end
  end
end
