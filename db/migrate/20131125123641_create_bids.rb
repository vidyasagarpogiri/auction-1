class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :price, :precision => 9, :scale => 2

      t.timestamps
    end
    add_index :bids, [:user_id, :product_id]
  end
end
