class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.decimal :price, :precision => 9, :scale => 2
      t.decimal :step,  :precision => 9, :scale => 2
      t.datetime :start_at
      t.integer :duration

      t.timestamps
    end
    add_index :products, [:user_id, :start_at]
  end
end
