class SetOrderKeyAsPrimaryKey < ActiveRecord::Migration[5.0]
  def change
    add_index :orders, :order_key, unique: true
  end
end
