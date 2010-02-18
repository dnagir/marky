class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :user_id
      t.timestamps
    end
    add_index :orders, :user_id
  end

  def self.down
    remove_index :orders, :user_id
    drop_table :orders
  end
end
